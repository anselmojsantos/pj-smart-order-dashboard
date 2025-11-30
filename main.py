import pandas as pd
import numpy as np
import plotly.express as px
import plotly.graph_objects as go
import streamlit as st
##from projecoes.modelos import projecao_media


@st.cache_data
def carregar_dados():
    payments = pd.read_csv("Banco de Dados/payments.csv", sep=';', encoding='latin-1')
    payments['created_at'] = pd.to_datetime(payments['created_at'], errors='coerce').dt.date
    payments['total'] = payments['total'].str.replace(',', '.', regex=False).astype(float)
    return payments

payments = carregar_dados()

# =============================================
# SIDEBAR - RESUMO GERAL
# =============================================
st.sidebar.title("📊 Resumo Geral")
with st.sidebar.expander("ℹ️ Sobre o Dashboard"):
    st.markdown(
        """
         Este dashboard foi desenvolvido para fornecer insights valiosos sobre o desempenho de um restaurante
         específico, ele faz parte de outro projeto que envolve um sistema de comanda digital com node.js e react.js. 
         Um projeto Integrador II - Univesp, ele apresenta análises detalhadas sobre movimentação e aceitação 
         dos clientes, projeções futuras, pratos mais vendidos, desempenho dos garçons e feedback dos clientes.
        
        **Fontes de Dados Utilizadas:**
        - Pagamentos
        - Itens do Pedido
        - Produtos
        - Garçons
        - Pesquisa de Satisfação
        
        **Desenvolvido por: Grupo do Projeto Integrador II - Univesp 2025

        """
    )




st.set_page_config(page_title="Dashboard Smart Order", layout="wide", initial_sidebar_state="expanded")
st.title("🍽️ Dashboard Smart Order")

# =============================================
# SEÇÃO 1: LINHA DO TEMPO
# =============================================

st.header("📈 Linha do Tempo - Movimentação")

if not payments.empty:
    col1, col2, col3, col4 = st.columns(4)
       
    with col1:
        soma_total = payments['total'].sum()
        st.metric("💰 Valor Total", f"R$ {soma_total:,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.'))
    with col2:
        qtd_pagamentos = payments['status'].count()
        st.metric("💳 Pagamentos", f"{qtd_pagamentos:,}") 
    with col3:
        media_pagamentos = payments['total'].mean()
        st.metric("🎫 Média por Pagamento", f"R$ {media_pagamentos:,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.'))
    with col4:
        dias_analisados = payments['created_at'].nunique()
        st.metric("📅 Dias Analisados", f"{dias_analisados} dias")

    agrupar_datas = payments.groupby('created_at').agg({'total': 'sum'}).reset_index()
    
    pg_movimentacao = px.line(
        agrupar_datas,
        x = 'created_at',
        y ='total',
        title = "Linha do Tempo - Movimentação",
        labels = {
        'created_at': 'Data da Movimentação',
        'total': 'Valor Total (R$)'
    },
    markers=True
    )
    st.plotly_chart(pg_movimentacao, use_container_width=True)
else:
    st.warning("Nenhum dado disponível para exibir a linha do tempo.")

st.markdown("---")

# =============================================
# SEÇÃO 2: PROJEÇÃO PARA OS PRÓXIMOS 30 DIAS
# =============================================

st.header("🔮 Projeção para os Próximos 30 Dias")
st.subheader("📊 Dados Históricos dos Últimos 3 Dias")

col1, col2, col3 = st.columns(3)

data_total_gp =  payments.groupby(
    pd.to_datetime(payments['created_at'])).agg(
        valor_total=('total', 'sum'),
        qtd_pagamentos=('total', 'count')
    ).reset_index()

data_total_gp = data_total_gp.rename(columns={'created_at': 'data', 'total': 'valor_total'})

dados_3_dias = data_total_gp.sort_values('data').tail(3)

cols_historicos = st.columns(3)

for i in range(3):
    if i<len(dados_3_dias):
        row = dados_3_dias.iloc[i]
        with cols_historicos[i]:
            st.metric(
                f"📅 {(row['data']).strftime('%d/%m/%Y')}",
                f"R$ {row['valor_total']:,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.'),
                f"{int(row['qtd_pagamentos'])} pagamentos"
            )
st.markdown("\n \n \n")


# Métricas de projeção

st.subheader("📈 Métricas da Projeção com base nos dias 29/10, 30/10, 31/10")
col1, col2, col3, col4 = st.columns(4)

dados_3_dias = data_total_gp.sort_values('data').head(3)
media_3_dias = dados_3_dias['valor_total'].mean()
ul_valor = dados_3_dias['valor_total'].iloc[-1]

cresc_max = media_3_dias * 0.02
variacao = (cresc_max / ul_valor if ul_valor !=0 else 0 ) * 100

if len(dados_3_dias) > 1:
    cresc_historico = (ul_valor - dados_3_dias['valor_total'].iloc[0]) / (len(dados_3_dias) - 1)
    cresc_suavizado = min(cresc_historico, cresc_max)
else:
    cresc_suavizado = cresc_max

cresc_suavizado = max(cresc_suavizado, 0)
projecoes = []
dias = 30

for i in range(1, dias + 1):
    vl_previsto = ul_valor + (cresc_suavizado * i)
    vl_limite = media_3_dias * variacao
    vl_previsto = min(vl_previsto, vl_limite)
    projecoes.append(vl_previsto)

ul_data = dados_3_dias['data'].max()
dt_futuras = []

dt_futuras = [ul_data + pd.Timedelta(days=i) for i in range(1, dias + 1)]
projecoes_df = pd.DataFrame({
    'data': dt_futuras,
    'valor_total': projecoes,
    'tipo': 'Projeção'
})


with col1:
    st.metric("📊 Média dos 3 Dias", f"R$ {media_3_dias:,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.'))
with col2:
    st.metric("📈 Crescimento Máximo (2%)", f"R$ {cresc_max:,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.'))
with col3:
    st.metric("📉 Variação", f"{variacao:,.2f}%")
with col4:
    st.metric("🎯 Valor Total Previsto 30 dias", f"R$ {projecoes_df['valor_total'].sum():,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.'))

st.markdown("\n")


#Grafico de projeção

fig =go.Figure()

fig.add_trace(go.Scatter(
    x = data_total_gp['data'],
    y = data_total_gp['valor_total'],
    mode = 'lines+markers+text',
    name = 'Dados Histórico',
    line = dict(color='blue', width=3),
    marker = dict(size=10),
    text = [f"R$ {v:,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.') for v in data_total_gp['valor_total']],
    textposition='top center'
))

cor_proj = 'orange'
nome_proj = 'Projeção (Média dos 3 primeiros dias)'

fig.add_trace(go.Scatter(
    x = projecoes_df['data'],
    y = projecoes_df['valor_total'],
    mode = 'lines+markers',
    name = nome_proj,
    line = dict(color=cor_proj, width=3),
    marker = dict(size=10)
))

fig.update_layout(
    title = "📊Projeção de Movimentação para os Próximos 30 Dias",
    xaxis_title = "Data",
    yaxis_title = "Valor Total (R$)",
    legend_title = "Legenda",
    hovermode = "x unified" 
)

st.plotly_chart(fig, use_container_width=True)

 # Tabela de projeção
st.markdown("📋 Tabela de Projeção para os Próximos 30 Dias")
with st.expander("📋 Ver Projeções Detalhadas"):
    tbl_proj = projecoes_df.copy()
    tbl_proj['Data'] = tbl_proj['data'].dt.strftime('%d/%m/%Y')
    tbl_proj['Valor (R$)'] = tbl_proj['valor_total'].apply(lambda x: f"R$ {x:,.2f}".replace(',', 'X').replace('.', ',').replace('X', '.'))
    tbl_proj['Dia Semana'] = tbl_proj['data'].dt.strftime('%A')
     
    st.dataframe(
        tbl_proj[['Data', 'Dia Semana', 'Valor (R$)']].reset_index(drop=True),
        use_container_width=True,
        hide_index=True
    )
    csv = tbl_proj[['Data', 'Dia Semana', 'Valor (R$)']].to_csv(index=False).encode('utf-8')
    st.download_button(
        label="⬇️ Baixar Projeções em CSV",
        data=csv,
        file_name='projecoes_30_dias.csv',
        mime='text/csv'
    )

st.markdown("---")

# =============================================
# SEÇÃO 3: TOP PRATOS + RANKING GARÇONS
# =============================================

produtos = pd.read_csv("Banco de Dados/products.csv", sep=',', encoding='utf-8')
items_pd = pd.read_csv("Banco de Dados/order_itens.csv", sep=',', encoding='utf-8')
waiters = pd.read_csv("Banco de Dados/waiters.csv", sep=',', encoding='utf-8')
orders = pd.read_csv("Banco de Dados/orders.csv", sep=',', encoding='utf-8')

pd_merged = pd.merge(
    items_pd,
    produtos,
    left_on = 'product_id',
    right_on = 'id',
    how = 'inner'
)

pratos = pd_merged['category'].isin(['pratos', 'pratos_do_dia'])

vd_por_produto = pd_merged[pratos].groupby(['name', 'category']).agg({
    'quantity': 'sum',
    'product_id': 'count'
}).sort_values('quantity', ascending=False).reset_index()


wrs_merged = pd.merge(
    orders,
    waiters,
    left_on = 'waiter_id',
    right_on = 'id',
    how = 'inner'
)

rank_waiters = wrs_merged.groupby(['name']).agg({
    'waiter_id':'count'
}).sort_values('waiter_id', ascending=False).reset_index()

col1, col2 = st.columns(2)


with col1:
    st.header("🍲 Top Pratos Vendidos")
    fig_pratos = px.bar(
        vd_por_produto.head(10),
        x='quantity',
        y='name',
        orientation='h',
        title='Top 10 Pratos Mais Vendidos',
        labels={
            'quantity': 'Quantidade Vendida',
            'name': 'Nome do Prato'
        }
    )
    st.plotly_chart(fig_pratos, use_container_width=True)

with col2:
    st.header("👨‍💼 Ranking de Garçons")
    fig_waiters = px.bar(
        rank_waiters.head(6),
        x='waiter_id',
        y='name',
        orientation='h',
        title='Ranks dos Garçons',
        labels={
            'waiter_id': 'Qtde de Atendimentos',
            'name': 'Garçons'
        }
    )

    st.plotly_chart(
        fig_waiters,
        use_container_width=True
        )
st.markdown("---")
# =============================================
# SEÇÃO 4: PESQUISA DE SATISFAÇÃO
# =============================================

st.header("⭐ Pesquisa de Satisfação")
satisfacao_cliente = pd.read_csv("Banco de Dados/satisfactions_survey.csv", sep=',', encoding='utf-8')
col1, col2, col3, col4, col5 = st.columns(5)

agrupar_sts = satisfacao_cliente.groupby('status').agg({
    'note':'count'
}).reset_index()    


satisfacao_sum = agrupar_sts['note'].sum()
agrupar_sts['percentual'] = (agrupar_sts['note'] / satisfacao_sum * 100
).round(2)


def get_percentual(status):
    try:
        return agrupar_sts.loc[agrupar_sts['status'] == status, 'percentual'].iloc[0]
    except IndexError:
        return 0.0


with col1:
    st.metric("😠 Péssimo", f"{get_percentual('pessimo'):.1f}%")

with col2:
    st.metric("😞 Ruim", f"{get_percentual('ruim'):.1f}%")

with col3:
    st.metric("😐 Regular", f"{get_percentual('regular'):.1f}%")

with col4:
    st.metric("😊 Bom", f"{get_percentual('bom'):.1f}%")

with col5:
    st.metric("😍 Excelente", f"{get_percentual('otimo'):.1f}%")

# =============================================
# SEÇÃO 5: TIPOS DE PAGAMENTO
# =============================================

st.header("💳 Analise de Pagamento")

col1, col2 = st.columns(2)

tipo_pag = payments.groupby('payment_type').agg({
    'total':'count',
}).reset_index()

fig_tipo_pag = px.pie(
    tipo_pag,
    names='payment_type',
    values='total',
    hole=0.2
)
col1.markdown("**Distribuição dos Tipos de Pagamento**")
col1.plotly_chart(fig_tipo_pag, use_container_width=True)

col2.markdown("**Detalhes dos Tipos de Pagamento**")
col2.dataframe(
   
    tipo_pag.rename(columns={'payment_type':'Tipo de Pagamento', 'total':'Quantidade de Pagamentos'}).sort_values(
        by='Quantidade de Pagamentos', ascending=False),
    use_container_width=True,
    hide_index=True,
)

st.markdown("---")

# =============================================
# RODAPÉ
# =============================================

st.markdown(
    """
    <div style='text-align: center; color: gray; padding: 20px;'>
        📊 Dashboard Smart Order • Desenvolvido com Streamlit • 
        Grupo do Projeto Integrador II - Univesp 2025
    </div>
    """, 
    unsafe_allow_html=True
)
