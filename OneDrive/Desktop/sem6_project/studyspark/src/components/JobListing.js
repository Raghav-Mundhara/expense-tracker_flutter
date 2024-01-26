// JobListing.js
import React, { useState } from 'react';
import './JobListing.css';

const JobListing = () => {
  const initialJobs = [
    { id: 1, title: 'AI/ML PPT', company: 'Raghav Mundhara', location: 'Remote', description: 'Lorem ipsum AI/ML description.' },
    { id: 2, title: 'Case Study', company: 'Kaushik Kotian', location: 'New York', description: 'Lorem ipsum Case Study description.' },
  ];

  const [jobs, setJobs] = useState(initialJobs);
  const [searchTerm, setSearchTerm] = useState('');

  const handleSearch = (event) => {
    const searchTerm = event.target.value.toLowerCase();
    setSearchTerm(searchTerm);

    const filteredJobs = initialJobs.filter(
      (job) =>
        job.title.toLowerCase().includes(searchTerm) ||
        job.company.toLowerCase().includes(searchTerm) ||
        job.location.toLowerCase().includes(searchTerm) ||
        job.description.toLowerCase().includes(searchTerm)
    );

    setJobs(filteredJobs);
  };

  return (
    <div className="job-listing-container">
      <div className="search-bar">
        <input
          type="text"
          placeholder="Search..."
          value={searchTerm}
          onChange={handleSearch}
        />
      </div>
      <h1>Job Listings</h1>
      <ul>
        {jobs.map(job => (
          <li key={job.id}>
            <h2>{job.title}</h2>
            <p>{job.company}</p>
            <p>{job.location}</p>
            <p className="job-description">{job.description}</p>
            <button>Apply Now</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default JobListing;
