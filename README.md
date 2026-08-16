# Smart Order Dashboard

Dashboard interativo para análise de desempenho de um restaurante, desenvolvido durante o **Projeto Integrador II — UNIVESP (2025)**.

## Sobre o projeto

O Smart Order é um sistema de comanda digital para restaurantes. Este repositório contém o **dashboard de análise de dados** desse sistema, que reúne em um único painel os principais indicadores de operação: movimentação financeira, produtos mais vendidos, desempenho da equipe, satisfação dos clientes e tipos de pagamento.

## Problema

Sem uma visão consolidada dos dados, decisões de cardápio, equipe e precificação ficam baseadas em suposições. O desafio era transformar os dados brutos do dia a dia do restaurante em informações acionáveis.

## Objetivo

Fornecer um painel interativo que permita acompanhar a evolução financeira, projetar a receita dos próximos dias e identificar padrões de produtos, atendimento e satisfação dos clientes.

## Dataset

Dados reais do estabelecimento exportados de um banco **PostgreSQL**:

| Arquivo | Descrição |
|---|---|
| `payments.csv` | Pagamentos realizados |
| `orders.csv` | Pedidos |
| `order_itens.csv` | Itens de cada pedido |
| `products.csv` | Catálogo de produtos |
| `waiters.csv` | Cadastro de garçons |
| `satisfactions_survey.csv` | Pesquisa de satisfação |

## Tecnologias

- Python 3.8+
- Streamlit
- Pandas / NumPy
- Plotly
- scikit-learn
- SQLAlchemy / psycopg2 (PostgreSQL)

## Tratamento dos dados

- Leitura dos CSVs com **Pandas**, respeitando codificação (`latin-1`) e separador (`;`) de cada arquivo;
- Normalização dos valores monetários (vírgula → ponto) e das datas;
- Junções (`merge`) entre pedidos, itens, produtos e garçons para análise consolidada.

## Análises

- **Movimentação financeira**: linha do tempo diária, valor total, número de pagamentos e ticket médio;
- **Projeção**: receita prevista para os próximos 30 dias, com base na média dos 3 primeiros dias e crescimento máximo de 2%;
- **Produtos**: top 10 pratos mais vendidos e quantidade por categoria;
- **Equipe**: ranking de garçons por número de atendimentos;
- **Satisfação**: distribuição das avaliações (Péssimo a Excelente);
- **Pagamentos**: distribuição e ticket médio por tipo de pagamento.

## Principais indicadores

- Valor total movimentado e ticket médio;
- Projeção de receita para os próximos 30 dias;
- Pratos mais vendidos;
- Desempenho da equipe;
- Índice de satisfação do cliente.

## Resultados

Um dashboard publicado e acessível pela web, com gráficos interativos (Plotly) e métricas consolidadas, que permite acompanhar os principais indicadores do negócio e apoiar a tomada de decisão.

## Aplicação

Acesse a aplicação: [Smart Order Dashboard](https://pj-smart-order-dashboard.streamlit.app/)

## Como executar

```bash
# 1. Clone o repositório
git clone https://github.com/anselmojsantos/pj-smart-order-dashboard.git

# 2. Acesse a pasta
cd pj-smart-order-dashboard

# 3. Crie e ative um ambiente virtual (recomendado)
python -m venv .venv
.venv\Scripts\activate    # Windows
# source .venv/bin/activate  # Linux / macOS

# 4. Instale as dependências
pip install -r requirements.txt

# 5. Execute o dashboard
streamlit run main.py
```

## Estrutura do projeto

```
pj-smart-order-dashboard/
├── main.py                 # Aplicação Streamlit (dashboard)
├── projecoes/
│   └── modelos.py          # Modelo de projeção de receita
├── Banco de Dados/         # CSVs exportados do PostgreSQL
├── requirements.txt        # Dependências do projeto
└── README.md
```

## Autor

Projeto desenvolvido pelo grupo do Projeto Integrador II — UNIVESP 2025.
