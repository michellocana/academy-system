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
import javax.swing.JLabel;
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
	
	/* TODO - fazer a parte de envio de arquivos usando o helper do ben-hur
	 *  	- 
	 */

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
			
//			String minhafoto = ImagemEncoderHelper.encodeImage(foto);
//			System.out.println("meunome: " + meunome);
//			System.out.println("minhafoto: " + minhafoto);
//			System.out.println("nomeparceiro: " + nomeparceiro);
//			System.out.println("fotoparceiro: " + fotoparceiro);
			
			
//			eventos.aoAceitar(socket, meunome, minhafoto, nomeparceiro, fotoparceiro);
				
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
					
						case -1: 
								JOptionPane.showMessageDialog(null, "Solicita��o recusada.");
								break;
					
						case 0:	//caso aceite a conexao
								
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
						
						case 1: //caso receba solicita��o de login
							if (JOptionPane.showConfirmDialog( null, rec.getString("nome") + " quer conversar. Aceitar?", "Solicita��o de Conversa",
									JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION){
								nomeparceiro = TelaChat.ucFirst(rec.getString( "nome" ));
								fotoparceiro = rec.getString( "img" );
								new TelaAceita( socket, eventos, nomeparceiro, fotoparceiro );
							}else{
								respondeSolicitacaoLogin( false );
							}
								break;
					
						case 2: tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + nomeparceiro +": " + rec.getString( "mensagem" ) );
							    break;
						case 3: tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n ATEN��O: " + nomeparceiro + " desconectou" );
								tc.getTexto().setEnabled( false );
								tc.getBtEnviar().setEnabled( false );
								tc.getBtEscolheArquivo().setEnabled(false);
								break;
						case 4: tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + nomeparceiro + " quer enviar um arquivo." + "\nArquivo: " + rec.getString("nomeArquivo") + " (" + rec.getInt("tamanho") + "KB)");
								if (JOptionPane.showConfirmDialog(tc.getFrame(), nomeparceiro + " quer enviar um arquivo." + "\nArquivo: " + rec.getString("nomeArquivo") + " (" + rec.getInt("tamanho") + "KB)", "Solicita��o de envio de arquivo",
									JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION) {
									tc.aceitaEnvioArquivo();
									tc.getAreaChat().setText( tc.getAreaChat().getText() + "\nVoc� aceitou o envio de arquivo.");
									
								} else {
								    tc.recusaEnvioArquivo();
								    tc.getAreaChat().setText( tc.getAreaChat().getText() + "\nVoc� recusou o envio de arquivo.");
								}
								break;
						case 5: tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + nomeparceiro + " aceitou o envio de arquivos.");
								tc.iniciaServidorArquivo( rec.getInt("porta") );
								break;
						case 6: tc.getAreaChat().setText( tc.getAreaChat().getText() + "\n" + nomeparceiro + " recusou o envio de arquivos.");
								break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}		
}
