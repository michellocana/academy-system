package Threads;

import java.awt.Component;
import java.awt.Image;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

import lib.ImagemEncoderHelper;

import org.json.JSONException;
import org.json.JSONObject;

import sun.awt.image.ByteArrayImageSource;
import Servidor.EventosDoServidorDeSockets;
import Telas.TelaAceita;
import Telas.TelaChat;

public class Recebedor extends Thread {
	
	private TelaChat tc;
	private Socket socket;
	private EventosDoServidorDeSockets eventos;

	private String meunome;
	private String minhafoto;
	private String nomeparceiro;
	private String fotoparceiro;
	
	private byte[] imagem;
	
	private boolean continua = true;
	
	
	public Recebedor( Socket s, EventosDoServidorDeSockets e ){
		
		this.socket = s;
		this.eventos = e;
		

		
	}
	
	public TelaChat getTc() {
		return tc;
	}

	public void setTc(TelaChat tc) {
		this.tc = tc;
		
		tc.setNmEle( nomeparceiro );
		tc.setFtEle( fotoparceiro );
	}

	public Socket getSocket() {
		return socket;
	}

	public void setSocket(Socket socket) {
		this.socket = socket;
	}

	public boolean isContinua() {
		return continua;
	}

	public void setContinua(boolean continua) {
		this.continua = continua;
	}
	
	
	private void respondeSolicitacaoLogin( boolean resposta ) throws IOException, JSONException{
		
		OutputStream os = socket.getOutputStream();
		DataOutputStream dos = new DataOutputStream( os );

		JSONObject transacao = new JSONObject();
		
		if ( resposta == true ){
			transacao.put( "cod", 0 );
			transacao.put( "nome", meunome );
			transacao.put("img", ImagemEncoderHelper.encodeImage(tc.getFtEu()));
		}else{
			transacao.put( "cod", -1 );
		}
		
		dos.writeUTF( transacao.toString() );
		
	}

	@Override
	public void run() {
		
		try {
			
			
			InputStream is = socket.getInputStream();
			DataInputStream dis = new DataInputStream( is );

			while( continua ) {
				
				String msg = dis.readUTF();
				if( msg != null ) {
					
					JSONObject rec = new JSONObject( msg );

					switch( rec.getInt( "cod" ) ) {
					
						case -1:// Recusa conexão 
								JOptionPane.showMessageDialog(null, "Solicitação recusada.");
								break;
					
						case 0:	// Aceita conexão
								
								nomeparceiro = TelaChat.ucFirst(rec.getString( "nome" ));
								fotoparceiro = rec.getString( "img" );
								
								eventos.aoReceberSocket( socket );
								
								tc.setNmEle( TelaChat.ucFirst(nomeparceiro) );
								
								Component comp = new Component() {};
								Image img = comp.createImage(new ByteArrayImageSource(ImagemEncoderHelper.decodeImage(fotoparceiro)));
								Image scaledInstance = img.getScaledInstance(tc.getFtEle().getWidth(), tc.getFtEle().getHeight(), Image.SCALE_DEFAULT);
								ImageIcon imageIcon = new ImageIcon(scaledInstance);
								tc.getFtEle().setIcon(imageIcon);
																
								break;
						
						case 1: // Recebe solicitação de login
							if (JOptionPane.showConfirmDialog( null, rec.getString("nome") + " quer conversar. Aceitar?", "Solicitação de Conversa",
									JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION){
								nomeparceiro = TelaChat.ucFirst(rec.getString( "nome" ));
								fotoparceiro = rec.getString( "img" );
								new TelaAceita( socket, eventos, nomeparceiro, fotoparceiro );
							}else{
								respondeSolicitacaoLogin( false );
							}
								break;
					
						case 2: // Recebe texto enviado pelo parceiro
								tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + nomeparceiro +": " + rec.getString( "mensagem" ) );
								break;
						case 3: // Recebe aviso quando o parceiro desconectou
								tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n ATENÇÃO: " + nomeparceiro + " desconectou" );
								tc.getTexto().setEnabled( false );
								tc.getBtEnviar().setEnabled( false );
								tc.getBtEscolheArquivo().setEnabled(false);
								break;
						case 4: // Recebe solicitação de envio de arquivo
								tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + nomeparceiro + " quer enviar um arquivo." + "\nArquivo: " + rec.getString("nomeArquivo") + " (" + rec.getInt("tamanho")/1024 + "KB)");
								if (JOptionPane.showConfirmDialog(tc.getFrame(), nomeparceiro + " quer enviar um arquivo." + "\nArquivo: " + rec.getString("nomeArquivo") + " (" + rec.getInt("tamanho")/1024 + "KB)", "Solicitação de envio de arquivo",
									JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION) {
									tc.aceitaEnvioArquivo(rec.getInt("tamanho"),rec.getString("nomeArquivo"));
									tc.getAreaChat().setText( tc.getAreaChat().getText() + "\nVocê aceitou o envio de arquivo.");
								} else {
								    tc.recusaEnvioArquivo();
								    tc.getAreaChat().setText( tc.getAreaChat().getText() + "\nVocê recusou o envio de arquivo.");
								}
								break;
						case 5: // Recebe aviso de que o envio de arquivos foi aceito
								tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + nomeparceiro + " aceitou o envio de arquivos.");
								tc.iniciaServidorArquivo( rec.getInt("porta") );
								break;
						case 6: // Recebe aviso de que o envio de arquivos foi recusado
								tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + nomeparceiro + " recusou o envio de arquivos.");
								break;
						case 7: // Recebe aviso de que o envio de arquivos foi concluido
								tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + "Arquivo recebido com sucesso.");
								break;
						case 8: // Recebe aviso de que o envio de arquivos teve erro
								tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + "Falha no recebimento de arquivo.");
								break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}		
}
