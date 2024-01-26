
import React, { useState } from 'react';

import './Header.css';


const Header = () => {
  const [showDropdown, setShowDropdown] = useState(false);

  const toggleDropdown = () => {
    setShowDropdown(!showDropdown);
  };

  return (
    <div className="header">
      <div className="logo">studyspark</div>
      <div className="dropdown">
        <button onClick={toggleDropdown}>Find Work</button>
        {showDropdown && (
          <div className="dropdown-content">
        
          </div>
        )}
      </div>
      <div className="dropdown">
        <button onClick={toggleDropdown}>Jobs</button>
        {showDropdown && (
          <div className="dropdown-content">
           
          </div>
        )}
      </div>
      <div className="dropdown">
        <button onClick={toggleDropdown}>Reports</button>
        {showDropdown && (
          <div className="dropdown-content">
           
          </div>
        )}
      </div>
      <div className="dropdown">
        <button onClick={toggleDropdown}>Messages</button>
        {showDropdown && (
          <div className="dropdown-content">
            {/* Dropdown content for Messages */}
            {/* Add your specific content here */}
          </div>
        )}
         <div className="profile-section">
          {/* Content for the profile section */}
          {/* This can include a user avatar, username, etc. */}
        </div>
      </div>
    </div>
  );
};

export default Header;
