/* EndoClin-Logico: */

CREATE TABLE Atendente (
    fk_Usuario_cpf CHARACTER,
    fk_Usuario_login CHARACTER,
    PRIMARY KEY (fk_Usuario_cpf, fk_Usuario_login)
);

CREATE TABLE Medico (
    crm CHARACTER,
    fk_Usuario_cpf CHARACTER,
    fk_Usuario_login CHARACTER,
    PRIMARY KEY (crm, fk_Usuario_cpf, fk_Usuario_login)
);

CREATE TABLE Caixa (
    fk_Usuario_cpf CHARACTER,
    fk_Usuario_login CHARACTER,
    PRIMARY KEY (fk_Usuario_cpf, fk_Usuario_login)
);

CREATE TABLE Administrador (
    login CHARACTER PRIMARY KEY,
    senha CHARACTER
);

CREATE TABLE Usuario (
    cpf CHARACTER,
    nome CHARACTER,
    nascimento DATE,
    entrada DATE,
    saida DATE,
    celular CHARACTER,
    id_endereco CHARACTER,
    login CHARACTER,
    senha CHARACTER,
    PRIMARY KEY (cpf, login)
);

CREATE TABLE Consulta (
    horario DATE
);

CREATE TABLE Plano_de_saude (
    id_plano CHARACTER,
    tipo CHARACTER,
    desconto DOUBLE
);

CREATE TABLE Pagamento (
    privado CHARACTER,
    plano CHARACTER,
    id_pagamento CHARACTER PRIMARY KEY
);

CREATE TABLE Anamnese (
    id_anamnese CHARACTER,
    id_paciente CHARACTER
);

CREATE TABLE Endereco (
    logradouro CHARACTER,
    cep CHARACTER,
    numero INTEGER,
    bairro CHARACTER,
    cidade CHARACTER,
    uf CHARACTER,
    id_endereco CHARACTER PRIMARY KEY
);

CREATE TABLE tem_Endereco_Usuario (
    fk_Endereco_id_endereco CHARACTER,
    fk_Usuario_cpf CHARACTER,
    fk_Usuario_login CHARACTER
);

CREATE TABLE Paciente (
);

CREATE TABLE gerencia (
    fk_Administrador_login CHARACTER
);

CREATE TABLE marca (
    fk_Atendente_fk_Usuario_cpf CHARACTER,
    fk_Atendente_fk_Usuario_login CHARACTER
);

CREATE TABLE realiza (
    fk_Caixa_fk_Usuario_cpf CHARACTER,
    fk_Caixa_fk_Usuario_login CHARACTER,
    fk_Pagamento_id_pagamento CHARACTER
);

CREATE TABLE faz (
    fk_Medico_crm CHARACTER,
    fk_Medico_fk_Usuario_cpf CHARACTER,
    fk_Medico_fk_Usuario_login CHARACTER
);

CREATE TABLE gerencia (
    fk_Administrador_login CHARACTER,
    fk_Usuario_cpf CHARACTER,
    fk_Usuario_login CHARACTER
);

CREATE TABLE eh (
    fk_Usuario_cpf CHARACTER,
    fk_Usuario_login CHARACTER
);
 
ALTER TABLE Atendente ADD CONSTRAINT FK_Atendente_2
    FOREIGN KEY (fk_Usuario_cpf, fk_Usuario_login)
    REFERENCES Usuario (cpf, login)
    ON DELETE CASCADE;
 
ALTER TABLE Medico ADD CONSTRAINT FK_Medico_2
    FOREIGN KEY (fk_Usuario_cpf, fk_Usuario_login)
    REFERENCES Usuario (cpf, login)
    ON DELETE CASCADE;
 
ALTER TABLE Caixa ADD CONSTRAINT FK_Caixa_2
    FOREIGN KEY (fk_Usuario_cpf, fk_Usuario_login)
    REFERENCES Usuario (cpf, login)
    ON DELETE CASCADE;
 
ALTER TABLE tem_Endereco_Usuario ADD CONSTRAINT FK_tem_Endereco_Usuario_1
    FOREIGN KEY (fk_Endereco_id_endereco)
    REFERENCES Endereco (id_endereco);
 
ALTER TABLE tem_Endereco_Usuario ADD CONSTRAINT FK_tem_Endereco_Usuario_2
    FOREIGN KEY (fk_Usuario_cpf, fk_Usuario_login)
    REFERENCES Usuario (cpf, login);
 
ALTER TABLE gerencia ADD CONSTRAINT FK_gerencia_1
    FOREIGN KEY (fk_Administrador_login)
    REFERENCES Administrador (login)
    ON DELETE SET NULL;
 
ALTER TABLE marca ADD CONSTRAINT FK_marca_1
    FOREIGN KEY (fk_Atendente_fk_Usuario_cpf, fk_Atendente_fk_Usuario_login)
    REFERENCES Atendente (fk_Usuario_cpf, fk_Usuario_login)
    ON DELETE SET NULL;
 
ALTER TABLE realiza ADD CONSTRAINT FK_realiza_1
    FOREIGN KEY (fk_Caixa_fk_Usuario_cpf, fk_Caixa_fk_Usuario_login)
    REFERENCES Caixa (fk_Usuario_cpf, fk_Usuario_login)
    ON DELETE SET NULL;
 
ALTER TABLE realiza ADD CONSTRAINT FK_realiza_2
    FOREIGN KEY (fk_Pagamento_id_pagamento)
    REFERENCES Pagamento (id_pagamento)
    ON DELETE SET NULL;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_1
    FOREIGN KEY (fk_Medico_crm, fk_Medico_fk_Usuario_cpf, fk_Medico_fk_Usuario_login)
    REFERENCES Medico (crm, fk_Usuario_cpf, fk_Usuario_login)
    ON DELETE SET NULL;
 
ALTER TABLE gerencia ADD CONSTRAINT FK_gerencia_1
    FOREIGN KEY (fk_Administrador_login)
    REFERENCES Administrador (login)
    ON DELETE SET NULL;
 
ALTER TABLE gerencia ADD CONSTRAINT FK_gerencia_2
    FOREIGN KEY (fk_Usuario_cpf, fk_Usuario_login)
    REFERENCES Usuario (cpf, login)
    ON DELETE SET NULL;
 
ALTER TABLE eh ADD CONSTRAINT FK_eh_1
    FOREIGN KEY (fk_Usuario_cpf, fk_Usuario_login)
    REFERENCES Usuario (cpf, login)
    ON DELETE SET NULL;