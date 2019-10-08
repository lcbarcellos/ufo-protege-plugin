/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufes.inf.nemo.ufo.protege.plugin;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *
 * @author luciano
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.SOURCE)
public @interface Extension {
    
    String id();
    
    ExtensionPoint point();    
    
    public enum ExtensionPoint {
        // org.protege.editor.core.application.ViewComponent
        VIEW_COMPONENT
        ;
        
        public static ExtensionPoint CUSTOM(String custom) {
            return null;
        }
    }
}