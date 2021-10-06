import React from 'react';

const Checkin = ({authenticity_token}) => {
  const submit = e => {
    e.preventDefault();
  }

  return (
    <form role='form' onSubmit={submit} className="flex flex-col">
    <input type='hidden' name='authenticity_token' value={authenticity_token}/>
    <input
      className="mb-6 h-10 text-center focus:ring-1 focus:ring-light-blue-400 focus:outline-none w-full placeholder-gray-500 border border-gray-200 rounded-md
                  md:mt-6 md:w-auto md:h-12"
      type='text'
      name='secret_code'
      placeholder="Secret Code"
    />
    <div className="flex flex-col md:flex md:flex-row">
      <button className="mb-4 h-10 rounded-md bg-blue-400 text-white md:w-3/5 md:h-12 md:mb-6"
      type="submit">CHECK IN</button>
      <button className="h-10 rounded-md bg-blue-400 text-white md:ml-8  md:w-3/5 md:h-12" type="submit">CHECK OUT</button>
    </div>
    </form>
  );
}

export default Checkin;
