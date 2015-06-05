package Telas;

import java.awt.Container;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import lib.ImagemEncoderHelper;
import sun.awt.image.ByteArrayImageSource;
import Servidor.EventosDoServidorDeSockets;
import Servidor.ServidorDeSockets;
import Threads.Recebedor;

public class Servidor extends JFrame implements EventosDoServidorDeSockets, ActionListener{
	
	private ServidorDeSockets servidor;	
	private Container container;
	private JLabel lblStatus;
	private JButton btIniciar;
	private int status;
	private Recebedor recebedor;
	
	public static void main(String[] args) throws UnknownHostException, IOException {
		
		new Servidor();
		
	}
	
	public Servidor(){
		
		this( 10, 10, 250, 150 );

	}

	public Servidor( int x, int y, int w, int h ){
		
		setLayout( null );
		
		setBounds( x, y, w, h );
		
		container = getContentPane();
		
		btIniciar = new JButton();
		btIniciar.setBounds( 25, 25, 200, 50);
		btIniciar.addActionListener( this );
		container.add( btIniciar );
		
		lblStatus = new JLabel("",SwingConstants.CENTER);
		lblStatus.setBounds( 25, 86, 200, 20 );
		container.add( lblStatus );
		
		setStatus( 0 );
		
		setVisible( true );
		
	}
	
	protected void setStatus( int s ){
		
		this.status = s;
		
		switch ( status ){
			
		case 0: lblStatus.setText( "Servidor offline." );
				btIniciar.setText( "Iniciar" );
			break;
			
		case 1: lblStatus.setText( "Servidor online." );
				btIniciar.setText( "Finalizar" );
			break;
		
		}
		
	}
	
	
	private void iniciaServidor( int porta ){
	
	if( servidor == null ) {
		
		try {
			
			servidor = new ServidorDeSockets( porta, this );
			servidor.start();

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	} else {
		
		servidor.finaliza();
		servidor = null;

	}
	
}

	@Override
	public void aoIniciarServidor() {

		setStatus( 1 );
	}

	@Override
	public void aoFinalizarServidor() {

		setStatus( 0 );
		
		servidor = null;
		
	}

	@Override
	public void aoReceberSocket(Socket s) {
		
		recebedor = new Recebedor( s, this );
		recebedor.start();
		
	}

	@Override
	public void reportDeErro(IOException e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void actionPerformed(ActionEvent arg0) {
		
		iniciaServidor( 1834 );
		
	}

	@Override
	public void aoAceitar( Socket s, String meunome, String minhafoto, String nomeparceiro, String fotoparceiro ) {

		TelaChat tc = new TelaChat( s, TelaChat.ucFirst(meunome) );
		
		tc.setNmEu( TelaChat.ucFirst(meunome) );
		tc.setNmEle( nomeparceiro );
		
		
		byte[] imageEu = ImagemEncoderHelper.decodeImage(minhafoto);
		Image img = createImage(new ByteArrayImageSource(imageEu));
		Image scaledInstance = img.getScaledInstance(tc.getFtEu().getWidth(), tc.getFtEu().getHeight(), Image.SCALE_DEFAULT);
		ImageIcon imageIcon = new ImageIcon(scaledInstance);
		tc.getFtEu().setIcon(imageIcon);
		
		byte[] imageEle = ImagemEncoderHelper.decodeImage(fotoparceiro);
		Image img2 = createImage(new ByteArrayImageSource(imageEle));
		Image scaledInstance2 = img2.getScaledInstance(tc.getFtEle().getWidth(), tc.getFtEle().getHeight(), Image.SCALE_DEFAULT);
		ImageIcon imageIcon2 = new ImageIcon(scaledInstance2);
		tc.getFtEle().setIcon(imageIcon2);
		
		recebedor.setTc( tc );
		
	}

	
	
}
