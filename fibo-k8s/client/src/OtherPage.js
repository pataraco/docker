import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
  return (
    <div>
      This is another page!
      <br/>
      <br/>
      Go back to the <Link to="/">home page</Link>
    </div>
  );
};
