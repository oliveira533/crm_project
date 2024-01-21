import React from 'react';
import './navbar.css';
import { FaHome }from "react-icons/fa";
import { FaGear }from "react-icons/fa6";
import { IoIosStats }from "react-icons/io";

function NavBar(){
    return(
        <nav className='nav'>
            <a href='#' className='item'><FaHome className='item-icon first-icon'/></a>
            <a href='#' className='item'><FaGear className='item-icon'/></a>
            <a href='#' className='item'><IoIosStats className='item-icon'/></a>
        </nav>
    )
}

export default NavBar;