/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Joyce
 */
public class Competidor
{
    int id;
    String nome;
    Date nascimento_date;
    
    public Competidor()
    {}
    
    public Competidor(int id, String nome, Date nascimento) throws ParseException
    {
        this.id = id;
        this.nome = nome;
        this.nascimento_date = nascimento;
    }
}
