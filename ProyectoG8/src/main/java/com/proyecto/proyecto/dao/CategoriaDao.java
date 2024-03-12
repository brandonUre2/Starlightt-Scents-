/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.proyecto.proyecto.dao;

import com.proyecto.proyecto.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author brand
 */
public interface CategoriaDao extends JpaRepository<Categoria, Long>{
    
}
