package Telas;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import org.json.JSONObject;

import Servidor.EventosDoServidorDeSockets;
import Servidor.ServidorDeSockets;
import Threads.Recebedor;

public class TelaChat extends JFrame implements WindowListener, EventosDoServidorDeSockets{
	
	private Socket socket;
	private Recebedor recebedor;
	private JTextArea areaChat;
	private JTextArea texto;
	private JButton btEnviar;
	private JButton btEscolheArquivo;
	private JLabel ftEu;	
	private JLabel nmEu = new JLabel("Eu");
	private JLabel ftEle;
	private JLabel nmEle = new JLabel( "Ele" );
	private String semfoto = "/img/semfoto.png";
	private JFrame frame;
	private boolean continua;
	private JFileChooser fc = new JFileChooser();


	public JTextArea getAreaChat() {
		return areaChat;
	}


	public void setAreaChat(JTextArea areaChat) {
		this.areaChat = areaChat;
	}


	public Socket getSocket() {
		return socket;
	}


	public JFrame getFrame() {
		return frame;
	}


	public void setFrame(JFrame frame) {
		this.frame = frame;
	}


	public void setSocket(Socket socket) {
		this.socket = socket;
	}


	public JTextArea getTexto() {
		return texto;
	}


	public void setTexto(JTextArea texto) {
		this.texto = texto;
	}


	public JButton getBtEnviar() {
		return btEnviar;
	}


	public void setBtEnviar(JButton btEnviar) {
		this.btEnviar = btEnviar;
	}


	public JButton getBtEscolheArquivo() {
		return btEscolheArquivo;
	}


	public void setBtEscolheArquivo(JButton btEscolheArquivo) {
		this.btEscolheArquivo = btEscolheArquivo;
	}


	public JLabel getFtEu() {
		return ftEu;
	}


	public void setFtEu(JLabel ftEu) {
		this.ftEu = ftEu;
	}


	public JLabel getNmEu() {
		return nmEu;
	}


	public void setNmEu(String nome) {
		
		nmEu.setText( nome );
		
	}


	public JLabel getFtEle() {
		return ftEle;
	}


	public void setFtEle(String fotoparceiro) {
		ftEle.setText( fotoparceiro );
	}


	public JLabel getNmEle() {
		return nmEle;
	}


	public void setNmEle(String nome) {
		
		nmEle.setText( nome );
		
	}


	private ServidorDeSockets servidorArquivo;
	private ServerSocket serverSoketArquivo;
	
	
	
	public TelaChat( Socket s, String titulo )
	{	
		setTitle( titulo );
		
		/*
		 * Pegando o jframe atual, para quando mostrar um MessageDialog, 
		 * ficar centralizado no meio do jframe, e n�o da tela inteira 		
		 */
		frame = this;
		this.socket = s;
		
		setBounds( 250, 100, 800, 500 );
		
		setLayout( null );
		
		ftEle = new JLabel();
		ftEle.setBounds( 15, 25, 120, 120 );
		ftEle.setIcon( new ImageIcon( getClass().getResource( semfoto ) ) );
		ftEle.setHorizontalAlignment( ftEle.CENTER );
		getContentPane().add( ftEle );
		
		nmEle.setBounds( 15, 145, 120, 20);
		getContentPane().add( nmEle );	
		
		ftEu = new JLabel();
		ftEu.setBounds( 15, 310, 120, 120 );
		ftEu.setIcon( new ImageIcon( getClass().getResource( semfoto ) ) );
		ftEu.setHorizontalAlignment( ftEu.CENTER );
		getContentPane().add( ftEu );	
		
		nmEu.setBounds( 15, 430, 120, 20);
		getContentPane().add( nmEu );	
		
		areaChat = new JTextArea();	
		areaChat.setEditable( false );
		JScrollPane tasp = new JScrollPane( areaChat );
		tasp.setBounds( 150, 25, 600, 300 );
		getContentPane().add( tasp );
		
		// BOT�O DE ENVIAR ARQUIVO
		btEscolheArquivo = new JButton( "Arquivo" );
		btEscolheArquivo.setBounds( 540, 435, 100, 25 );
		
		btEscolheArquivo.addActionListener(
	            new ActionListener(){
	                public void actionPerformed(ActionEvent e){
	                    fc = new JFileChooser();
	                    int res = fc.showOpenDialog(null);
	                    
	                    if(res == JFileChooser.APPROVE_OPTION){
	                        File arquivo = fc.getSelectedFile();  
	                        
	                        try {
	                			OutputStream os = socket.getOutputStream();
	                			DataOutputStream dos = new DataOutputStream( os );

	                			JSONObject transacao = new JSONObject();
	                			transacao.put("cod", 4);
	                			transacao.put("nomeArquivo",arquivo.getName());
	                			
	                			/*
	                			 * O tamanho do arquivo � do tipo long,
	                			 * "(int)(long)" � para transformar em int.
	                			 */
	                			int tamanhoArquivo = (int)(long)(arquivo.length()/1024);
	                			
	                			transacao.put("tamanho", tamanhoArquivo);
	                			
	                			areaChat.setText( areaChat.getText() + "\nEnviando solicita��o de transfer�ncia de arquivo.\nArquivo: " + arquivo.getName() + " (" + tamanhoArquivo + "KB)");
	                			texto.setText( "" );
	                			texto.requestFocusInWindow();
	                			
	                			dos.writeUTF( transacao.toString() );
	                			
	                        } catch (Exception ee) {
	                			JOptionPane.showMessageDialog( null, "N�o foi poss�vel atender sua requisi��o: " + ee.getMessage() );
	                		}
	                        
	                    }
	                    JOptionPane.showMessageDialog(null, "Voce nao selecionou nenhum arquivo."); 
	                }
	            }   
	        );
		
		getContentPane().add( btEscolheArquivo );
		// BOT�O DE ENVIAR ARQUIVO
		
		texto = new JTextArea();
		JScrollPane txsp = new JScrollPane( texto );
		txsp.setBounds( 150, 330, 600, 100 );
		getContentPane().add( txsp );
    	
		// Listener para quando pressionar enter, vai enviar a mensagem da mesma forma 
		texto.addKeyListener(new KeyListener(){
		    @Override
		    public void keyPressed(KeyEvent e){
		        if(e.getKeyCode() == KeyEvent.VK_ENTER){
		        	e.consume();
			    	enviaTexto();
		        }
		    }

		    @Override
		    public void keyTyped(KeyEvent e) {}

		    @Override
		    public void keyReleased(KeyEvent e) {}
		});
		
		btEnviar = new JButton( "Enviar" );
		btEnviar.setBounds( 650, 435, 100, 25);
		
		btEnviar.addActionListener( new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				
				enviaTexto();
				
			}
		});
		
		addWindowListener(this);
		
		getContentPane().add( btEnviar );
		
		setVisible( true );
		
	}
	
	
	private void enviaTexto() {
		
		String txt = texto.getText();
		
		if( txt.length() > 0 ) {
			
			areaChat.setText( areaChat.getText() + "\nVocê: " + txt );
			texto.setText( "" );
			texto.requestFocusInWindow();
			
			enviaPeloSocket( txt );
		}
	}
	
	private void logout(){
		try {
			OutputStream os = socket.getOutputStream();
			DataOutputStream dos = new DataOutputStream( os );

			JSONObject transacao = new JSONObject();
			transacao.put( "cod", 3 );
			
			dos.writeUTF( transacao.toString() );
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog( this, "N�o foi poss�vel atender sua requisi��o: " + e.getMessage() );
		}
	}
	
	public void aceitaEnvioArquivo(){
		try {
			OutputStream os = socket.getOutputStream();
			DataOutputStream dos = new DataOutputStream( os );

			int nroPorta = 64000;
			
			JSONObject transacao = new JSONObject();
			transacao.put( "cod", 5 );
			transacao.put( "porta", nroPorta );
			
			dos.writeUTF( transacao.toString() );
			
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog( this, "N�o foi poss�vel atender sua requisi��o: " + e.getMessage() );
		}
	}
	
	public void recusaEnvioArquivo(){
		try {
			OutputStream os = socket.getOutputStream();
			DataOutputStream dos = new DataOutputStream( os );

			JSONObject transacao = new JSONObject();
			transacao.put( "cod", 6 );
			
			dos.writeUTF( transacao.toString() );
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog( this, "N�o foi poss�vel atender sua requisi��o: " + e.getMessage() );
		}
	}
		
	
	public void iniciaServidorArquivo( int porta ){
			
			if( servidorArquivo == null ) {
				try {
					
					servidorArquivo = new ServidorDeSockets( porta, this );
					servidorArquivo.start();
					
					FileInputStream fis = null;
					
					File arquivo = fc.getSelectedFile();
					String nomeArquivo = arquivo.getName();
					String tmpdir = System.getProperty("java.io.tmpdir");
					
					System.out.println("nome do arquivo: " + nomeArquivo);
					System.out.println("nome do arquivo: " + tmpdir);
					
					byte[] bFile = new byte[(int) arquivo.length()];
					 
					try {
						// Convertendo arquivo em array de bytes
						// acho que aqui � a parte que envia
						fis = new FileInputStream(arquivo);
						fis.read(bFile);
						fis.close();

						// Convertendo array de bytes em arquivo
						// acho que aqui � a parte que recebe
						FileOutputStream fileOuputStream = 
						new FileOutputStream(tmpdir + nomeArquivo); 
						fileOuputStream.write(bFile);
						fileOuputStream.close();

						System.out.println("enviar cod 7 para dizer que deu certo");
						}catch(Exception e){
							e.printStackTrace();
						}
					
					
	
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			} else {
				
				servidorArquivo.finaliza();
				servidorArquivo = null;
	
			}
			
		}
	
	public void finalizaServidorArquivo() {
			continua = false;
			try {
				serverSoketArquivo.close();
			} catch (IOException e) {
			}
	}
	
	private void enviaPeloSocket( String txt ) {
		
		try {
			OutputStream os = socket.getOutputStream();
			DataOutputStream dos = new DataOutputStream( os );

			JSONObject transacao = new JSONObject();
			transacao.put( "cod", 2 );
			transacao.put( "mensagem", txt );
			
			dos.writeUTF( transacao.toString() );
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog( this, "N�o foi poss�vel enviar sua mensagem: " + e.getMessage() );
		}
	}
	
	@Override
	public void windowActivated(WindowEvent arg0) {}

	@Override
	public void windowClosed(WindowEvent arg0) {}

	@Override
	public void windowClosing(WindowEvent arg0) {
		logout();
	}

	@Override
	public void windowDeactivated(WindowEvent arg0) {}

	@Override
	public void windowDeiconified(WindowEvent arg0) {}

	@Override
	public void windowIconified(WindowEvent arg0) {}

	@Override
	public void windowOpened(WindowEvent arg0) {}


	@Override
	public void aoIniciarServidor() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void aoFinalizarServidor() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void aoReceberSocket(Socket s) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void reportDeErro(IOException e) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void aoAceitar(Socket s, String mnome, String mfoto, String pnome,
			String pfoto) {
		// TODO Auto-generated method stub
		
	}
	
	public static String ucFirst(String word){
		word = word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
		return word;
	}



	

}
