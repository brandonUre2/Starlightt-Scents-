/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.proyecto.proyecto.service;

import com.proyecto.proyecto.domain.Producto;
import java.util.List;

/**
 *
 * @author brand
 */
public interface ProductoService {
    public List<Producto>getProductos(boolean activos);
    
    public Producto getProducto(Producto producto);
    
    public void delete(Producto producto);
    
    public void save(Producto producto);
}
