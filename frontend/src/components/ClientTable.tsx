import React from 'react';

type Client = {
  id: number;
  nome: string;
  cpf: string;
  email: string;
  telefone?: string;
  data_nascimento: string;
};

type Props = {
  clients: Client[];
  onEdit: (id: number) => void;
  onDelete: (id: number) => void;
};

const ClientTable: React.FC<Props> = ({ clients, onEdit, onDelete }) => {
  return (
    <table className="min-w-full table-auto">
      <thead>
        <tr>
          <th>Nome</th>
          <th>CPF</th>
          <th>E-mail</th>
          <th>Telefone</th>
          <th>Data de Nascimento</th>
          <th>Ações</th>
        </tr>
      </thead>
      <tbody>
        {clients.map(client => (
          <tr key={client.id}>
            <td>{client.nome}</td>
            <td>{client.cpf}</td>
            <td>{client.email}</td>
            <td>{client.telefone}</td>
            <td>{client.data_nascimento}</td>
            <td>
              <button onClick={() => onEdit(client.id)} className="btn btn-sm btn-secondary mr-2">Editar</button>
              <button onClick={() => onDelete(client.id)} className="btn btn-sm btn-danger">Excluir</button>
            </td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default ClientTable;
