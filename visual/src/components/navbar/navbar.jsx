import React from 'react';
import './navbar.css';
import { FaHome }from "react-icons/fa";

function NavBar(){
    return(
        <nav className='nav'>
            <a href='#'><FaHome /></a>
        </nav>
    )
}

export default NavBar;