import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import Clients from './pages/Clients';
import EditClient from './pages/EditClient';
import Login from './pages/Login';

const App: React.FC = () => {
  return (
    <Routes>
      <Route path="/" element={<Navigate to="/clientes" />} />
      <Route path="/clientes" element={<Clients />} />
      <Route path="/clientes/:id" element={<EditClient />} />
      <Route path="/login" element={<Login />} />
    </Routes>
  );
};

export default App;
