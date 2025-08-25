import React, { useEffect, useState } from 'react';
import ClientTable from '../components/ClientTable';
import { useClients } from '../hooks/useClients';
import { useNavigate } from 'react-router-dom';

const Clients: React.FC = () => {
  const { clients, fetchClients, deleteClient } = useClients();
  const navigate = useNavigate();

  useEffect(() => {
    fetchClients();
  }, []);

  return (
    <div className="container mx-auto py-8">
      <h1 className="text-2xl font-bold mb-4">Clientes</h1>
      <button className="btn btn-primary mb-4" onClick={() => navigate('/clientes/new')}>Novo Cliente</button>
      <ClientTable clients={clients} onEdit={id => navigate(`/clientes/${id}`)} onDelete={deleteClient} />
    </div>
  );
};

export default Clients;
