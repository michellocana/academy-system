<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Home extends CI_Controller {

    public function __construct() {
        parent::__construct();

        if(!checkVisualizar('grafico'))
            redirect(base_url());
    }
    
    public function index(){
        $data = array(
            "title" => "Gráficos"
        );

        $this->load->view('grafico/grafico', $data);
    }

    public function getHorariosDePico(){
        $date = date("Y-m-d");
        $date2 = date("Y-m-d", strtotime( date( "Y-m-d", strtotime( date("Y-m-d") ) ) . "-1 month" ) );
        $date3 = date("Y-m-d", strtotime( date( "Y-m-d", strtotime( date("Y-m-d") ) ) . "-2 month" ) );
        $date4 = date("Y-m-d", strtotime( date( "Y-m-d", strtotime( date("Y-m-d") ) ) . "-3 month" ) );

        $horariosCount = new stdClass();

        $horarios1 = $this->getHorarioDePico($date, $date2);
        $horariosCount->month10810 = 0;
        $horariosCount->month11012 = 0;
        $horariosCount->month11214 = 0;
        $horariosCount->month11416 = 0;
        $horariosCount->month11618 = 0;
        $horariosCount->month11820 = 0;
        $horariosCount->month12022 = 0;

        foreach ($horarios1 as $h1) {
            $currentHour = intval($h1->horaEntrada);

            if($currentHour >= 1 and $currentHour <= 10){
                $horariosCount->month10810++;
            }else if($currentHour > 10 and $currentHour <= 12){
                $horariosCount->month11012++;
            }else if($currentHour > 12 and $currentHour <= 14){
                $horariosCount->month11214++;
            }else if($currentHour > 14 and $currentHour <= 16){
                $horariosCount->month11416++;
            }else if($currentHour > 16 and $currentHour <= 18){
                $horariosCount->month11618++;
            }else if($currentHour > 18 and $currentHour <= 20){
                $horariosCount->month11820++;
            }else if($currentHour > 20){
                $horariosCount->month12022++;
            }
        }

        $horarios2 = $this->getHorarioDePico($date2, $date3);
        $horariosCount->month20810 = 0;
        $horariosCount->month21012 = 0;
        $horariosCount->month21214 = 0;
        $horariosCount->month21416 = 0;
        $horariosCount->month21618 = 0;
        $horariosCount->month21820 = 0;
        $horariosCount->month22022 = 0;

        foreach ($horarios2 as $h2) {
            $currentHour = intval($h2->horaEntrada);

            if($currentHour >= 1 and $currentHour <= 10){
                $horariosCount->month20810++;
            }else if($currentHour > 10 and $currentHour <= 12){
                $horariosCount->month21012++;
            }else if($currentHour > 12 and $currentHour <= 14){
                $horariosCount->month21214++;
            }else if($currentHour > 14 and $currentHour <= 16){
                $horariosCount->month21416++;
            }else if($currentHour > 16 and $currentHour <= 18){
                $horariosCount->month21618++;
            }else if($currentHour > 18 and $currentHour <= 20){
                $horariosCount->month21820++;
            }else if($currentHour > 20){
                $horariosCount->month22022++;
            }
        }

        $horarios3 = $this->getHorarioDePico($date, $date2);
        $horariosCount->month30810 = 0;
        $horariosCount->month31012 = 0;
        $horariosCount->month31214 = 0;
        $horariosCount->month31416 = 0;
        $horariosCount->month31618 = 0;
        $horariosCount->month31820 = 0;
        $horariosCount->month32022 = 0;

        foreach ($horarios3 as $h3) {
            $currentHour = intval($h3->horaEntrada);

            if($currentHour >= 1 and $currentHour <= 10){
                $horariosCount->month30810++;
            }else if($currentHour > 10 and $currentHour <= 12){
                $horariosCount->month31012++;
            }else if($currentHour > 12 and $currentHour <= 14){
                $horariosCount->month31214++;
            }else if($currentHour > 14 and $currentHour <= 16){
                $horariosCount->month31416++;
            }else if($currentHour > 16 and $currentHour <= 18){
                $horariosCount->month31618++;
            }else if($currentHour > 18 and $currentHour <= 20){
                $horariosCount->month31820++;
            }else if($currentHour > 20){
                $horariosCount->month32022++;
            }
        }

        echo json_encode($horariosCount);
    }

    public function getHorarioDePico($date, $date2){
        $this->db->select("horaEntrada");
        $this->db->where("data <= '" . $date . "'");
        $this->db->where("data >= '" . $date2 . "'");
        return $this->db->get('entrada_saida')->result();
    }

    public function getFrequenciaAlunos(){
        $date = date("Y-m-d", strtotime( date( "Y-m-d", strtotime( date("Y-m-d") ) ) . "-1 month" ) );

        $frequenciaCounter = [];

        for ($i=0; $i < 6; $i++) { 
            if($i == 0){
                $date1 = date("Y-m-d");
                $date2 = date("Y-m-d", strtotime( date( "Y-m-d", strtotime( date("Y-m-d") ) ) . "-" . $i ." month" ) );
            }else{
                $date1 = date("Y-m-d", strtotime( date( "Y-m-d", strtotime( date("Y-m-d") ) ) . "-" . $i ." month" ) );
                $date2 = date("Y-m-d", strtotime( date( "Y-m-d", strtotime( date("Y-m-d") ) ) . "-" . ($i + 1) ." month" ) );
            }

            $query = "SELECT DISTINCT idUsuario
                      FROM {PRE}entrada_saida
                      WHERE data < '" . $date1 . "'
                      AND data >= '" . $date2 . "'";
            $count = $this->db->query($query)->result();

            $frequenciaCounter[] = sizeof($count);

        }

        echo json_encode($frequenciaCounter);
    }

    public function getMasculinoFeminino(){
        $this->db->select('count(sexo) as count');
        $countClientes = $this->db->get('cliente')->result();
        $countClientes = $countClientes[0];
        $countClientes = $countClientes->count;

        $this->db->select('idCliente');
        $this->db->where('sexo', 'M');
        $countMasculino = $this->db->get('cliente')->result();

        $countMasculino = sizeof($countMasculino);

        $percentageMasculino = 100 / $countClientes * $countMasculino;

        echo $percentageMasculino;
    }

    public function getPorcentagemModalidades(){
        $this->db->select('idModalidade');
        $modalidades = $this->db->get('modalidade')->result();

        $countModalidades = [];
        $i = 0;
        foreach ($modalidades as $modalidade) {
            $this->db->select('idAula');
            $this->db->where('idModalidade', $modalidade->idModalidade);
            $aulas = $this->db->get('aula')->result();

            $countModalidades[$modalidade->idModalidade] = 0;

            foreach ($aulas as $aula) {
                $countModalidades[$modalidade->idModalidade]++;
            }
            
            $i++;
        }

        $infoModalidades = [];

        $countAllModalidades = 0;

        for ($i=1; $i < sizeof($countModalidades) + 1; $i++) { 
            if($countModalidades[$i] != 0){
                $this->db->select('nomeModalidade');
                $this->db->where('idModalidade', $i);

                $nomeModalidade = $this->db->get('modalidade')->result();
                $nomeModalidade = $nomeModalidade[0];
                $nomeModalidade = $nomeModalidade->nomeModalidade;

                $nomeModalidade = str_replace(' ', '-', $nomeModalidade);

                $infoModalidades[$i]['name'] = $nomeModalidade;
                $infoModalidades[$i]['idModalidade'] = $countModalidades[$i];

                $countAllModalidades = $countAllModalidades + $countModalidades[$i];
            }
        }

        
        for ($i = 1; $i < sizeof($infoModalidades) + 1; $i++) {
            $infoModalidades[$i]['y'] = 100 / $countAllModalidades * $countModalidades[$i];
        }

        echo json_encode($infoModalidades);
        // echo '<pre>' . print_r($infoModalidades,1);

        // echo '<pre>' .print_r($countModalidades,1);
    }
}