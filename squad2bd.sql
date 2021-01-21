-- *********** ATENÇÃO *******
-- Criar Banco de Dados com nome squad2BD


CREATE TABLE `demanda` (
  `id_demanda` int(11) NOT NULL,
  `id_morador` int(11) DEFAULT NULL,
  `id_mod` int(11) DEFAULT NULL,
  `local` varchar(75) DEFAULT NULL,
  `demanda_necessidade` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `demanda`
--

INSERT INTO `demanda` (`id_demanda`, `id_morador`, `id_mod`, `local`, `demanda_necessidade`) VALUES
(6, 1, 1, 'Rua tal, 811', 'sapato');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_entrega`
--

CREATE TABLE `forma_entrega` (
  `diretamente` int(11) DEFAULT NULL,
  `moderador` int(11) DEFAULT NULL,
  `retirar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id_mensagem` int(11) NOT NULL,
  `cttnome` varchar(45) NOT NULL,
  `cttemail` varchar(25) NOT NULL,
  `cttassunto` varchar(25) NOT NULL,
  `textomensagem` varchar(1500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mensagens`
--

INSERT INTO `mensagens` (`id_mensagem`, `cttnome`, `cttemail`, `cttassunto`, `textomensagem`) VALUES
(1, 'Roney', 'mail@mail.com', 'Um assunto a tratar', 'Texto da mensagem bla bla bal bla e coisa e tal e isso e aquilo\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `moderador`
--

CREATE TABLE `moderador` (
  `id_mod` int(11) NOT NULL,
  `nomemoderador` varchar(45) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `endereco` varchar(75) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `termos` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `moderador`
--

INSERT INTO `moderador` (`id_mod`, `nomemoderador`, `email`, `telefone`, `endereco`, `senha`, `termos`) VALUES
(1, 'Vitor', 'vitor@mail.com', '11998998899', 'rua tal, 266', '123456', 'sim'),
(6, 'Roney', 'Roney.phr@gmail.com', '11964113300', 'Rua Labréa, 79', '123456', 'aceito'),
(7, 'Guilherme ', 'guilherme@emailfake.com', '11955443322', 'Rua de Lá de Cima, 800', '1233', NULL),
(8, 'Carla', 'carla@emailfake.com', '11958886655', 'Rua Coisa, 777', '123456', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `morador`
--

CREATE TABLE `morador` (
  `id_morador` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `perfil` varchar(105) DEFAULT NULL,
  `foto_morador` varchar(15) DEFAULT NULL,
  `local` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `morador`
--

INSERT INTO `morador` (`id_morador`, `nome`, `perfil`, `foto_morador`, `local`) VALUES
(1, 'José', 'Perfil do morador', 'foto', 'Rua tal, 811'),
(2, 'Carlos Antonio', 'Mora na rua devido a problemas com a família.', NULL, 'Mora na ponto Azul, sentido centro.'),
(3, 'Maria Josefa', 'Mora na rua desde 2017 com seu marido Manoel.', NULL, 'Rua Corumbe, 9000 ao lado do mercado'),
(4, 'Rafael Mendes', 'Já foi motorista de caminhão. ', NULL, 'Rua de baixo, ao lado da borracharia.'),
(5, 'Magrão (Marcos Castelo)', 'Prefere ser chamado de magrão, reconhece reciclagem e entulho. ', NULL, 'Rua do lado de lá - perto da padaria Coisada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `processo_doacao`
--

CREATE TABLE `processo_doacao` (
  `id_morador` int(11) DEFAULT NULL,
  `necessidade` varchar(65) DEFAULT NULL,
  `doador` varchar(45) DEFAULT NULL,
  `entrega` varchar(45) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `demanda`
--
ALTER TABLE `demanda`
  ADD PRIMARY KEY (`id_demanda`),
  ADD UNIQUE KEY `id_demanda_UNIQUE` (`id_demanda`),
  ADD KEY `morador_idx` (`local`),
  ADD KEY `morador_idx1` (`id_morador`),
  ADD KEY `id_mod` (`id_mod`);

--
-- Índices para tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id_mensagem`);

--
-- Índices para tabela `moderador`
--
ALTER TABLE `moderador`
  ADD PRIMARY KEY (`id_mod`),
  ADD UNIQUE KEY `id_mod_UNIQUE` (`id_mod`);

--
-- Índices para tabela `morador`
--
ALTER TABLE `morador`
  ADD PRIMARY KEY (`id_morador`),
  ADD UNIQUE KEY `id_morador_UNIQUE` (`id_morador`);

--
-- Índices para tabela `processo_doacao`
--
ALTER TABLE `processo_doacao`
  ADD KEY `id_morador` (`id_morador`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `demanda`
--
ALTER TABLE `demanda`
  MODIFY `id_demanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id_mensagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `moderador`
--
ALTER TABLE `moderador`
  MODIFY `id_mod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `morador`
--
ALTER TABLE `morador`
  MODIFY `id_morador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `demanda`
--
ALTER TABLE `demanda`
  ADD CONSTRAINT `demanda_ibfk_2` FOREIGN KEY (`id_morador`) REFERENCES `morador` (`id_morador`),
  ADD CONSTRAINT `demanda_ibfk_3` FOREIGN KEY (`id_mod`) REFERENCES `moderador` (`id_mod`);

--
-- Limitadores para a tabela `processo_doacao`
--
ALTER TABLE `processo_doacao`
  ADD CONSTRAINT `processo_doacao_ibfk_1` FOREIGN KEY (`id_morador`) REFERENCES `morador` (`id_morador`),
  ADD CONSTRAINT `processo_doacao_ibfk_2` FOREIGN KEY (`id_morador`) REFERENCES `demanda` (`id_morador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
