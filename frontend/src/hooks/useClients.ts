import { useState } from 'react';
import axios from 'axios';

export function useClients() {
  const [clients, setClients] = useState<any[]>([]);

  const fetchClients = async () => {
    const res = await axios.get('/clientes');
    setClients(res.data);
  };

  const deleteClient = async (id: number) => {
    await axios.delete(`/clientes/${id}`);
    setClients(clients.filter(c => c.id !== id));
  };

  const updateClient = async (id: number, values: any) => {
    await axios.put(`/clientes/${id}`, values);
    fetchClients();
  };

  return { clients, fetchClients, deleteClient, updateClient };
}
