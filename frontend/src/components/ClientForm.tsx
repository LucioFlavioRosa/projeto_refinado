import React, { useState } from 'react';
import { validateCPF, validateEmail } from '../utils/validators';

type ClientFormProps = {
  initialValues?: {
    nome: string;
    cpf: string;
    email: string;
    telefone?: string;
    data_nascimento: string;
  };
  onSubmit: (values: any) => void;
};

const ClientForm: React.FC<ClientFormProps> = ({ initialValues, onSubmit }) => {
  const [form, setForm] = useState(initialValues || {
    nome: '',
    cpf: '',
    email: '',
    telefone: '',
    data_nascimento: ''
  });
  const [errors, setErrors] = useState<{ [key: string]: string }>({});

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const validate = () => {
    const errs: { [key: string]: string } = {};
    if (!form.nome || form.nome.length < 2) errs.nome = 'Nome obrigatório';
    if (!validateCPF(form.cpf)) errs.cpf = 'CPF inválido';
    if (!validateEmail(form.email)) errs.email = 'E-mail inválido';
    if (!form.data_nascimento) errs.data_nascimento = 'Data de nascimento obrigatória';
    return errs;
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const errs = validate();
    setErrors(errs);
    if (Object.keys(errs).length === 0) {
      onSubmit(form);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <label htmlFor="nome" className="block">Nome</label>
        <input type="text" name="nome" value={form.nome} onChange={handleChange} className="input" />
        {errors.nome && <span className="text-red-500">{errors.nome}</span>}
      </div>
      <div>
        <label htmlFor="cpf" className="block">CPF</label>
        <input type="text" name="cpf" value={form.cpf} onChange={handleChange} className="input" />
        {errors.cpf && <span className="text-red-500">{errors.cpf}</span>}
      </div>
      <div>
        <label htmlFor="email" className="block">E-mail</label>
        <input type="email" name="email" value={form.email} onChange={handleChange} className="input" />
        {errors.email && <span className="text-red-500">{errors.email}</span>}
      </div>
      <div>
        <label htmlFor="telefone" className="block">Telefone</label>
        <input type="text" name="telefone" value={form.telefone} onChange={handleChange} className="input" />
      </div>
      <div>
        <label htmlFor="data_nascimento" className="block">Data de Nascimento</label>
        <input type="date" name="data_nascimento" value={form.data_nascimento} onChange={handleChange} className="input" />
        {errors.data_nascimento && <span className="text-red-500">{errors.data_nascimento}</span>}
      </div>
      <button type="submit" className="btn btn-primary">Salvar</button>
    </form>
  );
};

export default ClientForm;
