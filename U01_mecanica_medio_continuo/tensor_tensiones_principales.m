%{
  TENSIONES Y DIRECCIONES PRINCIPALES DE UN TENSOR DE TENSIONES 3x3
  -------------------------------------------------------------------
  Dado el tensor de tensiones de Cauchy sigma (simetrico, 3x3), este
  programa calcula:
    - Los invariantes de tension I1, I2, I3
    - Las tensiones principales (autovalores de sigma)
    - Las direcciones principales (autovectores de sigma)
  ordenando las tensiones principales de mayor a menor:
      sigma1 >= sigma2 >= sigma3
  y verifica que las direcciones principales sean ortonormales y que
  el tensor se reconstruya correctamente a partir de ellas.
%}

clear; clc; clf;

% ==================== DATOS DEL PROGRAMA ====================

% Tensor de tensiones sigma (MPa, o las unidades que uses).
% Convencion: fila/columna 1=x, 2=y, 3=z. Debe ser simetrico:
%   sigma = [ sxx  sxy  sxz
%             sxy  syy  syz
%             sxz  syz  szz ]
sigma = [ 55   40   -10
           40   25   50
           -10   50   10 ];

% Tolerancia numerica para verificar simetria y ortonormalidad
tol = 1e-8;

% ==================== INICIO DEL PROGRAMA ====================

% --- Verificacion de simetria del tensor ---
if max(max(abs(sigma - sigma'))) > tol
  error('El tensor de tensiones no es simetrico. Revisa los datos.');
endif

% --- Invariantes de tension ---
I1 = trace(sigma);
I2 = 0.5 * (trace(sigma)^2 - trace(sigma * sigma));
I3 = det(sigma);

% --- Autovalores (tensiones principales) y autovectores (direcciones) ---
% eig() en Octave devuelve V (autovectores en columnas) y D (autovalores
% en la diagonal), tal que sigma*V = V*D
[V, D] = eig(sigma);
autovalores = diag(D);

% --- Ordenar de mayor a menor: sigma1 >= sigma2 >= sigma3 ---
[autovalores, orden] = sort(autovalores, 'descend');
V = V(:, orden);

sigma1 = autovalores(1);
sigma2 = autovalores(2);
sigma3 = autovalores(3);

n1 = V(:,1);   % direccion principal asociada a sigma1
n2 = V(:,2);   % direccion principal asociada a sigma2
n3 = V(:,3);   % direccion principal asociada a sigma3

% --- Verificacion: los autovectores deben ser ortonormales ---
error_ortonormalidad = max(max(abs(V' * V - eye(3))));

% --- Verificacion: reconstruccion del tensor a partir de V y D ---
sigma_reconstruido = V * diag(autovalores) * V';
error_reconstruccion = max(max(abs(sigma_reconstruido - sigma)));

% --- Tension normal octaedrica y tension cortante maxima (extra util) ---
sigma_oct = I1 / 3;
tau_max = (sigma1 - sigma3) / 2;

% ==================== RESULTADOS EN PANTALLA ====================

printf('\n--- INVARIANTES DE TENSION ---\n');
printf('I1 = %10.4f\n', I1);
printf('I2 = %10.4f\n', I2);
printf('I3 = %10.4f\n', I3);

printf('\n--- TENSIONES PRINCIPALES ---\n');
printf('sigma1 = %10.4f\n', sigma1);
printf('sigma2 = %10.4f\n', sigma2);
printf('sigma3 = %10.4f\n', sigma3);

printf('\n--- DIRECCIONES PRINCIPALES (vectores unitarios, en columnas) ---\n');
printf('n1 = [%8.4f %8.4f %8.4f]\n', n1);
printf('n2 = [%8.4f %8.4f %8.4f]\n', n2);
printf('n3 = [%8.4f %8.4f %8.4f]\n', n3);

printf('\n--- OTRAS CANTIDADES DERIVADAS ---\n');
printf('Tension octaedrica (sigma_oct) = %10.4f\n', sigma_oct);
printf('Tension cortante maxima (tau_max) = %10.4f\n', tau_max);

printf('\n--- VERIFICACIONES ---\n');
printf('Error ortonormalidad de autovectores: %.2e\n', error_ortonormalidad);
printf('Error reconstruccion del tensor:      %.2e\n', error_reconstruccion);
if error_ortonormalidad < tol && error_reconstruccion < tol
  printf('OK: autovectores ortonormales y tensor reconstruido correctamente.\n');
else
  printf('ADVERTENCIA: revisar resultados, el error supera la tolerancia.\n');
endif

