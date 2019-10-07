/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufes.inf.nemo.ufo.protege;

import java.awt.event.ActionEvent;
import javax.swing.JOptionPane;
import org.protege.editor.owl.ui.action.ProtegeOWLAction;

/**
 *
 * @author luciano
 */
public class Command extends ProtegeOWLAction {

    public void actionPerformed(ActionEvent ae) {
        JOptionPane.showMessageDialog(getOWLWorkspace(), "Command test!");
    }

    public void initialise() throws Exception {

    }

    public void dispose() throws Exception {

    }
}
