export function validateCPF(cpf: string): boolean {
  cpf = cpf.replace(/\D/g, '');
  if (cpf.length !== 11) return false;
  // Adicione validação real de CPF se necessário
  return true;
}

export function validateEmail(email: string): boolean {
  return /^\S+@\S+\.\S+$/.test(email);
}
