package Telas;

import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import lib.ImagemEncoderHelper;

import org.json.JSONObject;

import sun.awt.image.ByteArrayImageSource;
import Servidor.EventosDoServidorDeSockets;
import Threads.Recebedor;

public class Cliente extends JFrame implements EventosDoServidorDeSockets {
	
	private JTextField tfHost;
	private JTextField tfPorta;	
	
	private JLabel foto;
	private Recebedor recebedor;
	
	private JTextField tfNome;
	
	private String meunome;
	private String minhafoto;
    
	public Cliente()
	{
		
		setBounds( 500, 100, 420, 250);
		setLayout( null );
		
		JLabel nome = new JLabel( "Nome:" );
		nome.setBounds( 15, 10, 60, 20 );
		getContentPane().add( nome );
		
		tfNome = new JTextField();
		tfNome.setBounds( 80, 10, 150, 20 );
		getContentPane().add( tfNome );
	
		//-----------------------------------//
		
		JLabel host = new JLabel( "Parceiro:" );
		host.setBounds( 15, 35, 60, 20 );
		getContentPane().add( host );
		
		tfHost = new JTextField();
		tfHost.setBounds( 80, 35, 110, 20 );
		getContentPane().add( tfHost );
		
		//-----------------------------------//
		
		JLabel dots = new JLabel( ":" );
		dots.setBounds( 191, 35, 5, 20);		
		getContentPane().add( dots );
		
		tfPorta = new JTextField();
		tfPorta.setBounds( 195, 35, 35, 20 );
		getContentPane().add( tfPorta );
		
		//-----------------------------------//
		
		foto = new JLabel();
		foto.setBounds(245, 10, 150, 150);
		foto.setIcon( new ImageIcon( getClass().getResource( "/img/semfoto.png" ) ) );
		foto.setHorizontalAlignment( SwingConstants.CENTER );
		getContentPane().add( foto );
		
		JLabel tamanho = new JLabel("150x150 pixels");
		tamanho.setHorizontalAlignment(SwingConstants.CENTER);
		tamanho.setBounds(245,170,150,20);
		getContentPane().add(tamanho);

		//-----------------------------------//
		
		setDefaultCloseOperation( DISPOSE_ON_CLOSE );
		
		//-----------------------------------//
		
		final JLabel cFoto = new JLabel();
		cFoto.setBounds( 15, 80, 270, 20 );	
		getContentPane().add( cFoto );
		
		JButton btFoto = new JButton( "Foto" );
		btFoto.setBounds( 15, 80, 100, 20 );
		
		btFoto.addActionListener(
	            new ActionListener(){
	                public void actionPerformed(ActionEvent e){
	                    JFileChooser fc = new JFileChooser();
	                    int res = fc.showOpenDialog(null);
	                    
	                    if(res == JFileChooser.APPROVE_OPTION){
	                        File arquivo = fc.getSelectedFile();  
	                        
	                        // Pegando a extens�o do arquivo
	                        String extensao = arquivo.getName().substring(arquivo.getName().lastIndexOf(".")+1).toLowerCase();
	                        	
	                        if(!extensao.equals("jpg") && !extensao.equals("jpeg")){
	                        	JOptionPane.showMessageDialog(null, "Formato de Arquivo inv�lido.");
	                        }else{
	                        	foto.setIcon(new ImageIcon(arquivo.getAbsolutePath()));
	                        }
	                    }
	                }
	            }   
	        );
		
		getContentPane().add( btFoto );
		
		//-----------------------------------//
		
		JButton btConectar = new JButton( "Conectar" );
		btConectar.setBounds( 125, 80, 100, 20 );
		
		btConectar.addActionListener( new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				
				conectar();
				
			}
		});	
		
		getContentPane().add( btConectar );
		
		setVisible( true );
		
	}
	
	//---------------------------------------------------------------------------------------//
	
	public Cliente( Socket s ) throws IOException
	{
		
		setBounds( 500, 100, 420, 250);
		setLayout( null );
		
		JLabel nome = new JLabel( "Nome:" );
		nome.setBounds( 15, 10, 60, 20 );
		getContentPane().add( nome );
		
		tfNome = new JTextField();
		tfNome.setBounds( 80, 10, 150, 20 );
		getContentPane().add( tfNome );
	
		//-----------------------------------//
		
		foto = new JLabel();
		foto.setBounds(245, 10, 150, 150);
		foto.setIcon( new ImageIcon( getClass().getResource( "/img/semfoto.png" ) ) );
		foto.setHorizontalAlignment( SwingConstants.CENTER );
		getContentPane().add( foto );
		
		JLabel tamanho = new JLabel("150x150 pixels");
		tamanho.setHorizontalAlignment(SwingConstants.CENTER);
		tamanho.setBounds(245,170,150,20);
		getContentPane().add(tamanho);

		//-----------------------------------//
		
		setDefaultCloseOperation( DISPOSE_ON_CLOSE );
		
		//-----------------------------------//
		
		JLabel cFoto = new JLabel();
		cFoto.setBounds( 15, 80, 270, 20 );	
		getContentPane().add( cFoto );
		
		JButton btFoto = new JButton( "Foto" );
		btFoto.setBounds( 15, 80, 100, 20 );
		    	
		btFoto.addActionListener(
	            new ActionListener(){
	                public void actionPerformed(ActionEvent e){
	                    JFileChooser fc = new JFileChooser();
	                    int res = fc.showOpenDialog(null);
	                    
	                    if(res == JFileChooser.APPROVE_OPTION){
	                        File arquivo = fc.getSelectedFile();  
	                        
	                        // Pegando a extens�o do arquivo
	                        String extensao = arquivo.getName().substring(arquivo.getName().lastIndexOf(".")+1).toLowerCase();
	                        	
	                        if(!extensao.equals("jpg") && !extensao.equals("jpeg")){
	                        	JOptionPane.showMessageDialog(null, "Formato de Arquivo inv�lido.");
	                        }else{
	                        	foto.setIcon(new ImageIcon(arquivo.getAbsolutePath()));
	                        }
	                        							
	                    }
	                }
	            }   
	        );
		
		getContentPane().add( btFoto );
		
		//-----------------------------------//
		
		JButton btConectar = new JButton( "Conectar" );
		btConectar.setBounds( 125, 80, 100, 20 );
		String imgBase64 = ImagemEncoderHelper.encodeImage(foto);
		
		btConectar.addActionListener( new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				solicitaLogin( 0 , s, TelaChat.ucFirst(tfNome.getText()), imgBase64 );
			}
		});	
		
		getContentPane().add( btConectar );
		
		setVisible( true );
		
	}
	
	//---------------------------------------------------------------------------------------//
	
	protected void conectar(){
		
		String ip = tfHost.getText().trim();
		String prt = tfPorta.getText().trim();
		
		try {
			
			int nroPrt = Integer.parseInt( prt );
			
			try {
				
				//cria um socket ao se conectar com o parceiro
				Socket socket = new Socket( ip, nroPrt );
				
				if( socket != null ){
				
					//inicia a thread do recebedor usando o socket criado
					recebedor = new Recebedor( socket, this );
					recebedor.start();
					
					String base64Image = ImagemEncoderHelper.encodeImage(foto);
					
					//fun��o para solicitar o login com o parceiro
					solicitaLogin( 1, socket, TelaChat.ucFirst(tfNome.getText()) , base64Image );
					
				}
				
									
			} catch( Exception e ) {
				
				JOptionPane.showMessageDialog( this, "Erro: " + e.getMessage()  );

			}
			
		} catch( Exception e ) {
			
			
			
		}
		
		
		
	}
	
	private void solicitaLogin( int cod ,Socket s, String nome, String img ){
		
		try {
			OutputStream os = s.getOutputStream();
			DataOutputStream dos = new DataOutputStream( os );

			JSONObject transacao = new JSONObject();
			transacao.put( "cod", cod );
			transacao.put( "nome", nome );
			transacao.put( "img", img);
			
			meunome = nome;
			minhafoto = img;
			
			dos.writeUTF( transacao.toString() );
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog( this, "N�o foi poss�vel enviar sua solicita��o: " + e.getMessage() );
		}
		
	}
	
	
	public static void main(String[] args) {
		
		new Cliente();
		
	}

	@Override
	public void aoIniciarServidor() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void aoFinalizarServidor() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void aoReceberSocket(Socket socket) {
		
		this.dispose();
		
		TelaChat tc = new TelaChat( socket, TelaChat.ucFirst(meunome) );
		
		tc.setNmEu( TelaChat.ucFirst(meunome) );
		
		// Setando imagem de perfil
		byte[] imag = ImagemEncoderHelper.decodeImage(minhafoto);
		Image img = createImage(new ByteArrayImageSource(imag));
		Image scaledInstance = img.getScaledInstance(tc.getFtEu().getWidth(), tc.getFtEu().getHeight(), Image.SCALE_DEFAULT);
		ImageIcon imageIcon = new ImageIcon(scaledInstance);
		tc.getFtEu().setIcon(imageIcon);

		recebedor.setTc( tc );
		
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


	
}
