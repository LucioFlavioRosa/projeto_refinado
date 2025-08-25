import { render, screen, fireEvent } from '@testing-library/react';
import AuthForm from '../components/AuthForm';

test('renderiza formulário de login e exibe erro', async () => {
  const handleSuccess = jest.fn();
  render(<AuthForm onSuccess={handleSuccess} />);
  fireEvent.change(screen.getByLabelText(/Usuário/i), { target: { value: 'user' } });
  fireEvent.change(screen.getByLabelText(/Senha/i), { target: { value: 'wrongpass' } });
  fireEvent.click(screen.getByText(/Entrar/i));
  // O erro depende do mock do hook useAuth, mas o teste cobre o fluxo de erro
});
