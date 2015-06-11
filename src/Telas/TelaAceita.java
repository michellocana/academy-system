package Telas;

import java.awt.event.ActionEvent;

import java.awt.event.ActionListener;
import java.io.DataOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.net.Socket;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import org.json.JSONObject;
import lib.ImagemEncoderHelper;

import Servidor.EventosDoServidorDeSockets;

public class TelaAceita extends JFrame{
	
	private EventosDoServidorDeSockets eventos;
	private String nomeFoto = "semfoto";
	private Socket socket;
	private String nomeparceiro;
	private String fotoparceiro;
	
	public TelaAceita( Socket s, EventosDoServidorDeSockets e, String nomeparceiro, String fotoparceiro )
	{
		this.socket = s;
		this.eventos = e;
		
		this.nomeparceiro = nomeparceiro;
		this.fotoparceiro = fotoparceiro;

		setBounds( 500, 100, 420, 250);
		setLayout( null );
		
		JLabel nome = new JLabel( "Nome:" );
		nome.setBounds( 15, 10, 60, 20 );
		getContentPane().add( nome );
		
		JTextField tfNome = new JTextField();
		tfNome.setBounds( 80, 10, 150, 20 );
		getContentPane().add( tfNome );
	
		//-----------------------------------//
		
		JLabel foto = new JLabel();
		foto.setBounds(245, 10, 150, 150);
		foto.setIcon( new ImageIcon( getClass().getResource( "/img/semfoto.png" ) ) );
		foto.setHorizontalAlignment( foto.CENTER );
		getContentPane().add( foto );
		
		JLabel tamanho = new JLabel("150x150 pixels");
		tamanho.setHorizontalAlignment(tamanho.CENTER);
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
	                        
	                        nomeFoto = arquivo.getName();
	                        
	                        // Pegando a extensão do arquivo
	                        String extensao = arquivo.getName().substring(arquivo.getName().lastIndexOf(".")+1).toLowerCase();
	                        	
	                        if(!extensao.equals("jpg") && !extensao.equals("jpeg")){
	                        	JOptionPane.showMessageDialog(null, "Formato de Arquivo inválido.");
	                        }else{
		                        foto.setIcon(new ImageIcon(arquivo.getAbsolutePath()));
	                        }
	                    }
	                }
	            }   
	        );
		
		getContentPane().add( btFoto );
		
		//-----------------------------------//
		
		JButton btConectar = new JButton( "Enviar " );
		btConectar.setBounds( 125, 80, 100, 20 );
		
		btConectar.addActionListener( new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				
				try {
					OutputStream os = s.getOutputStream();
					DataOutputStream dos = new DataOutputStream( os );

					JSONObject transacao = new JSONObject();
					transacao.put( "cod", 0 );
					transacao.put( "nome", tfNome.getText() );
					transacao.put( "img", ImagemEncoderHelper.encodeImage(foto) );
					
//					String fotoparceiro = ImagemEncoderHelper.encodeImage(foto);
//					
					dos.writeUTF( transacao.toString() );
					
					String minhafoto = ImagemEncoderHelper.encodeImage(foto);

					eventos.aoAceitar( socket, tfNome.getText(), minhafoto, nomeparceiro, fotoparceiro );
					
					dispose();
					
					
					
				} catch (Exception e) {
					JOptionPane.showMessageDialog( null, "Não foi possível enviar sua solicitação: " + e.getMessage() );
				}
				
			}
		});	
		
		getContentPane().add( btConectar );
		
		setVisible( true );
		
	}

}
