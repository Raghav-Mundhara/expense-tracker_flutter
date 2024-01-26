// App.js
import React from 'react';
import Header from './components/Header';  
import JobListing from './components/JobListing';

const App = () => {
  return (
    <div>
      <Header />
      <JobListing />
      {/* Add other components or content here */}
    </div>
  );
};

export default App;
