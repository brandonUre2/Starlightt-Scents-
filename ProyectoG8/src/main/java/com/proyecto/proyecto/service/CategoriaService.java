/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.proyecto.proyecto.service;

import com.proyecto.proyecto.domain.Categoria;
import java.util.List;

/**
 *
 * @author brand
 */
public interface CategoriaService {
    public List<Categoria>getCategorias(boolean activos);
    
    public Categoria getCategoria(Categoria categoria);
    
    public void delete(Categoria categoria);
    
    public void save(Categoria categoria);
}
