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
public class Competidor extends Tabela
{
    int id;
    String nome;
    Calendar nascimento;
    
    public Competidor(int id, String nome, int day, int month, int year) throws ParseException
    {
        this.id = id;
        this.nome = nome;
        this.nascimento = format.getCalendar();
        this.nascimento.set(year, month - 1, day);
    }
}
