BEAUTY STUDIO PRO — PACOTE PARA CLOUDFLARE PAGES
Banco D1 de destino: manicure001 (binding variável: DB)

BEAUTY STUDIO PRO
Publicação: Cloudflare Pages > Upload direto > envie esta pasta (index.html na raiz). Sem build, sem Node.
Instalar: abra o site no Chrome/Android > menu > "Instalar app". Funciona offline após o primeiro acesso.
Dados operacionais: IndexedDB local com sincronização para Cloudflare D1 pela Function /api/salvar. O binding D1 deve se chamar exatamente DB e apontar para o banco manicure001.
Faça backup em Configurações > Exportar backup JSON. A sincronização D1 acontece pela Function em functions/api/salvar.js.
PDF: Relatórios > Baixar PDF > "Salvar como PDF" na janela de impressão.

--- ATUALIZAÇÃO ---
* Senha de ADM (padrão 2506, altere em Configurações) agora também é pedida para: excluir agendamento, editar/excluir lançamento do Financeiro e editar/excluir produto do Estoque.
* Caixa > Receber pagamento: escolha um produto do estoque + quantidade; ao registrar, dá baixa no estoque (saída 'venda') e lança a entrada no financeiro.
* Configurações (nome, dados, logo, senha) salvam automaticamente e são sincronizadas pelo banco D1 para todos os aparelhos. Imagens são reduzidas antes de salvar.
* IMPORTANTE: reenvie também a pasta functions/ ao Cloudflare Pages (a function agora aceita a tabela 'settings').
* Botão de Suporte (WhatsApp 67 99646-2518) no menu e em Configurações.

--- MULTI-LOJAS (tela inicial / ADM / MASTER) ---
* Ao abrir o app aparece a TELA INICIAL: [Loja] e [ADM].
  - Loja: entra no dashboard normal (se houver mais de uma loja liberada, pergunta qual).
  - ADM: pede nome + senha de ADM (padrão 2506). Mostra o resumo de cada loja, o resumo da loja principal,
    o relatório de todas/escolhidas (PDF e CSV) e as configurações (loja principal, abrir direto na loja, senha).
* MASTER (só o criador): botão INVISÍVEL no canto SUPERIOR DIREITO da tela inicial. Toque ali, digite 1989.
  Marque as lojas liberadas (até 10) e dê nome. Salvar desbloqueio → vale para todos os aparelhos do cliente.
* Cada loja tem dados separados (clientes, caixa, estoque...). A Loja 1 usa o banco que já existia (nada se perde).
  No D1 as lojas 2, 3... são gravadas com sufixo @2, @3 (ex.: clients@2).
* A function /api/salvar recusa gravar em loja não liberada e só aceita liberar loja com a senha master.
  Para trocar a senha master no servidor: Cloudflare Pages > Settings > Variables > MASTER_PIN.
  (Se MASTER_PIN não existir, vale 1989.)
* IMPORTANTE: reenvie a pasta functions/ junto com o resto.
* O ADM pode renomear cada loja em ADM > Configurações > Nome das lojas (vazio = volta ao nome padrão).

--- AJUSTES FINAIS ---
* Estoque: removidas as setas de baixar/retirar manualmente. Ficou só ➕ (adicionar ao estoque) e 🛒 (venda, que lança no financeiro).
  A baixa de estoque acontece no ato da venda (Caixa > Receber pagamento). Editar/excluir produto continua pedindo a senha de ADM.
* Senha de cada loja: em ADM > Configurações > "Senha de entrada das lojas" o dono define a senha de cada loja (padrão 2506; vazio volta ao padrão).
  Quem toca em "Loja" só entra com a senha da loja escolhida. O ADM abre qualquer loja sem senha. Sincroniza entre aparelhos (registro global/adm).
* Tema: em ADM > Configurações > "Tema do aplicativo" o dono escolhe Escuro ou Claro para todas as lojas e aparelhos.
  O botão de alternar tema saiu das Configurações da loja.
* Master: o botão do canto superior direito da tela inicial agora tem um pontinho visível (claro no fundo preto, escuro no fundo branco).

--- AJUSTES (rodada 3) ---
* Sincronização do tema/senhas/modo de acesso entre aparelhos: agora usa o relógio do SERVIDOR (functions/api/salvar.js) em vez do relógio de cada aparelho.
  Os aparelhos conferem as preferências do ADM a cada 15 segundos. IMPORTANTE: reenvie também a pasta functions/.
* Escolha da loja: lista padronizada (mesmo tamanho, cor por loja, texto sempre legível).
* Senha de ADM sempre digitada: os campos de senha deixaram de ser "password" (o navegador não salva nem preenche).
  Pedem a senha: excluir agendamento/cliente/barbeiro/serviço/produto/lançamento, editar produto/lançamento,
  editar atendimento concluído e tirar um atendimento do status "Concluído" (isso apagaria o lançamento no financeiro).
* Botão "💬 Suporte" pequeno no canto superior esquerdo da tela inicial (some dentro da loja).
* ADM > Configurações > "Acesso às lojas": escolher entre "Senha para entrar na loja" (senha de cada loja) ou "Entrar sem senha".
  Nas duas opções, excluir itens continua pedindo a senha de ADM.
* Ícone do app instalado: fixo em assets/icons/ (não muda com a logo que a loja sobe).

--- ÍCONE DO APP INSTALADO ---
* Ícone fixo da marca em assets/icons/ (icon-master.png = original 1254px). Gerados: icon-192/512 (cantos transparentes), icon-maskable-192/512 (Android adaptativo),
  apple-touch-icon.png (iPhone) e favicon-48.png. Referenciados em manifest.json e index.html. A logo que cada loja sobe nas Configurações NÃO altera esse ícone.
* Para trocar no futuro: substitua esses arquivos mantendo os nomes. Quem já instalou precisa desinstalar e instalar de novo.

--- AJUSTES (rodada 4) ---
* ADM > Configurações: tema, acesso às lojas (com senha / sem senha), senhas das lojas, loja principal, abertura do app e nomes das lojas
  agora só valem ao tocar em "💾 Salvar configurações". O app confirma no servidor e avisa se não conseguiu gravar.
  Aparece "Há alterações não salvas" enquanto houver mudança pendente, e o tema fica em pré-visualização até salvar.
* Correção do "volta sozinho depois de uns 15 s": o servidor ignorava a gravação quando o registro antigo tinha data maior
  (relógio de algum aparelho adiantado). Agora os registros globais são sempre gravados. REENVIE a pasta functions/.
* Mensagens ao cliente (WhatsApp): cada mensagem tem os botões "📋 Copiar" e "💬 WhatsApp" lado a lado.

--- AJUSTE (rodada 5) ---
* Menu lateral: o botão ☰ (Expandir/Recolher menu, que mostra os nomes: Agendamentos, Clientes...) estava cortado no topo em telas baixas. Corrigido; em telas baixas os ícones ficam mais compactos.

--- AJUSTES (rodada 6) ---
* A aba "Configurações" saiu do menu das lojas. Tudo da empresa passou para ADM > Configurações e vale para TODAS as lojas:
  logo, nome comercial, razão social, CNPJ, telefone, WhatsApp, e-mail, endereço, Instagram, horário e dias de funcionamento, tema e cor do sistema.
  Salva com "💾 Salvar configurações" (também aparece uma barra flutuante "Salvar" quando há alteração pendente).
* Na primeira vez, o formulário já vem preenchido com os dados que a Loja 1 tinha. Ao salvar, passam a valer para todas as lojas.
* Backup e restauração foram para o ADM: exporta todas as lojas num arquivo e restaura numa loja escolhida (aceita backups antigos de uma loja só).
* As preferências do ADM são conferidas a cada 30 s (mais leve para o plano gratuito do Cloudflare); só baixam de novo quando algo mudou.
* O botão Suporte da tela inicial some dentro da área do ADM.

--- AJUSTES (rodada 7) ---
* Menu: "Caixa" agora fica logo depois do "Dashboard".
* Caixa > "Movimentações": mostra TODAS as movimentações do dia (dinheiro, PIX, crédito, débito, outros, despesas, retiradas, aportes e saídas do caixa),
  com hora, tipo, descrição, forma de pagamento e valor (+ verde / - vermelho). Abas para filtrar por forma de pagamento, com contagem e saldo da aba.
  A "Dinheiro na gaveta" continua contando só o dinheiro físico (PIX e cartão não entram na gaveta).
* service-worker.js estava vazio; agora cacheia o app para abrir offline (rede primeiro, então atualizações chegam normalmente). /api nunca é cacheada.


============================================================
VERSÃO BEAUTY STUDIO PRO — MANICURE / CABELEIREIRA
============================================================

Esta versão foi adaptada para dois modelos de negócio:
- Manicure / Nail designer
- Cabeleireira / Salão

O sistema de barbearia original permanece separado; esta versão não oferece esse perfil no ADM.

No ADM > Configurações:
- Modelo de negócio: seleciona Manicure ou Cabeleireira.
- Tema de cores: Escuro ou Claro.
- Layout: 5 opções independentes das cores (Premium, Compacto, Cards destacados,
  Minimalista e Espaçado/amplo).
- A cor de destaque continua configurável e não é substituída pela escolha do layout.

Na área MASTER (toque no ponto do canto superior direito da tela inicial, senha padrão 1989):
- Mantido o limite de até 10 lojas.
- Mantidos Salvar desbloqueio e Redefinir senha ADM.
- Adicionados os botões "Testar modo manicure" e "Testar modo cabeleireira".
- A opção "Permitir demonstrações na tela inicial" libera esses dois acessos para visitantes e clientes, sem senha MASTER.
- As demonstrações criam clientes, profissionais, serviços, agendamentos, movimentações,
  produtos e valores fictícios.
- Cada demonstração usa um IndexedDB local separado (beauty_demo_manicure / beauty_demo_cabeleireira).
  Nenhum registro de demonstração é enviado ao D1 ou misturado com lojas reais.
- Use "Sair da demonstração" para voltar à tela inicial.
- O MASTER pode desativar a demonstração a qualquer momento desmarcando a opção e salvando o desbloqueio.

BANCO DE DADOS CLOUDFLARE D1:
- Nome do banco D1: manicure001 (tudo minúsculo, sem espaço).
- Nome da variável de binding usada pela aplicação: DB (exatamente assim, sem espaços). Nome do banco D1 selecionado: manicure001.
- No painel Cloudflare Pages, configure Functions > D1 database bindings:
  Variable name: DB
  D1 database: manicure001
- A Function continua na rota /api/salvar e cria a tabela "registros" automaticamente.
  O arquivo schema.sql também contém o SQL para criação manual opcional.
- Não é necessário renomear a variável DB no código; DB é o nome do binding e manicure001
  é o banco D1 ao qual esse binding deve apontar.
- O banco novo começa independente do banco usado pela versão anterior.

PUBLICAÇÃO:
1. Extraia o ZIP mantendo index.html na raiz da pasta.
2. Envie todos os arquivos e pastas para um repositório GitHub.
3. Conecte o repositório ao Cloudflare Pages.
4. Framework preset: None / Nenhum; Build command vazio; Build output directory: / (raiz).
5. Configure o binding D1 DB apontando para manicure001.
6. Faça um novo deploy e teste a sincronização em dois dispositivos.

OBSERVAÇÃO SOBRE SENHAS:
As senhas padrão existentes foram preservadas: MASTER 1989, ADM/loja 2506.
Altere-as futuramente pela área administrativa quando desejar.


--- BEAUTY STUDIO PRO — VERSÃO MANICURE / CABELEIREIRA ---
* Segmentos disponíveis em ADM > Configurações: Manicure / Nail designer e Cabeleireira / Salão.
* Cinco layouts selecionáveis no ADM: Premium, Compacto, Cards destacados, Minimalista e Espaçado/amplo. Layout independente do tema escuro/claro e da cor de destaque.
* MASTER (senha padrão 1989): permite até 10 lojas e controla a opção “Permitir demonstrações na tela inicial”.
* Quando a demonstração estiver habilitada e salva, os visitantes veem os botões “Conhecer modo manicure” e “Conhecer modo cabeleireira” na tela inicial.
* Cada demonstração usa IndexedDB local separado, com clientes, profissionais, serviços, agendamentos, atendimentos, estoque e movimentações fictícias. Não sincroniza nem grava dados demonstrativos no D1.
* Para sair da demonstração, use “Sair da demonstração” na barra superior.
* Binding D1 obrigatório no Cloudflare Pages: Tipo Banco de dados D1; Nome/Variable name DB; Valor/banco manicure001. Reenvie também functions/api/salvar.js.
* A Function cria automaticamente a tabela registros na primeira chamada. O arquivo schema.sql é opcional.
* Senha MASTER padrão: 1989. Senha ADM/loja padrão: 2506.
* Após substituir os arquivos no GitHub, confirme o deploy e teste gravação/consulta no D1 antes de entregar o endereço aos clientes.


--- AJUSTE FINAL DE NAVEGAÇÃO ---
* O atalho "Início" foi retirado da coluna de módulos e reposicionado acima do conteúdo principal, separado do menu lateral/inferior para evitar saídas acidentais.
* O botão não aparece na tela inicial nem na área ADM. Ao sair de uma demonstração, o retorno à tela inicial também encerra a sessão demonstrativa.
* Demonstrações Manicure e Cabeleireira já estavam implementadas nesta versão: aparecem na tela inicial quando "Permitir demonstrações na tela inicial" está ativado no MASTER.
* Layouts e identidade visual existentes foram preservados.
