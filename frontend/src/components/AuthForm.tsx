import React, { useState } from 'react';
import { useAuth } from '../hooks/useAuth';

type AuthFormProps = {
  onSuccess: () => void;
};

const AuthForm: React.FC<AuthFormProps> = ({ onSuccess }) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const { login } = useAuth();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    const res = await login(username, password);
    if (res.success) {
      onSuccess();
    } else {
      setError(res.message);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <label htmlFor="username" className="block">Usuário</label>
        <input type="text" name="username" value={username} onChange={e => setUsername(e.target.value)} className="input" />
      </div>
      <div>
        <label htmlFor="password" className="block">Senha</label>
        <input type="password" name="password" value={password} onChange={e => setPassword(e.target.value)} className="input" />
      </div>
      {error && <span className="text-red-500">{error}</span>}
      <button type="submit" className="btn btn-primary">Entrar</button>
    </form>
  );
};

export default AuthForm;
