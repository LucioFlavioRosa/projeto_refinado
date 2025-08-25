import { render, screen, fireEvent } from '@testing-library/react';
import ClientForm from '../components/ClientForm';

test('valida campos obrigatórios do formulário de cliente', () => {
  const handleSubmit = jest.fn();
  render(<ClientForm onSubmit={handleSubmit} />);
  fireEvent.click(screen.getByText(/Salvar/i));
  expect(screen.getByText(/Nome obrigatório/i)).toBeInTheDocument();
  expect(screen.getByText(/CPF inválido/i)).toBeInTheDocument();
  expect(screen.getByText(/E-mail inválido/i)).toBeInTheDocument();
});
