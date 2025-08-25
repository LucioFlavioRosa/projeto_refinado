import React from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useClients } from '../hooks/useClients';
import ClientForm from '../components/ClientForm';

const EditClient: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const { clients, updateClient } = useClients();
  const navigate = useNavigate();
  const client = clients.find(c => c.id === Number(id));

  if (!client) return <div>Cliente não encontrado.</div>;

  return (
    <div className="container mx-auto py-8">
      <h1 className="text-2xl font-bold mb-4">Editar Cliente</h1>
      <ClientForm initialValues={client} onSubmit={values => {
        updateClient(client.id, values);
        navigate('/clientes');
      }} />
    </div>
  );
};

export default EditClient;
