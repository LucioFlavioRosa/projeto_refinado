import { useState } from 'react';
import axios from 'axios';

export function useAuth() {
  const [token, setToken] = useState<string | null>(localStorage.getItem('token'));

  const login = async (username: string, password: string) => {
    try {
      const res = await axios.post('/auth/login', { username, password });
      setToken(res.data.access_token);
      localStorage.setItem('token', res.data.access_token);
      return { success: true };
    } catch (err: any) {
      return { success: false, message: err.response?.data?.detail || 'Erro ao autenticar' };
    }
  };

  const logout = () => {
    setToken(null);
    localStorage.removeItem('token');
  };

  return { token, login, logout };
}
