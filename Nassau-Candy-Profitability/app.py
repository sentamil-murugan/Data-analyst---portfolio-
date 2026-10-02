import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt
@st.cache_data
def load_data():
    df = pd.read_csv('Nassau-Candy-Profitability/Nassau_Candy_Distributor.csv')
    df['Order Date'] = pd.to_datetime(df['Order Date'], format='%d/%m/%Y')
    df['Ship Date'] = pd.to_datetime(df['Ship Date'], format='%d/%m/%Y')
    return df
df = load_data()
st.title('Nassau Candy: Product Profitability & Margin Dashboard')
date_range = st.sidebar.date_input(
    'Order Date Range',
    [df['Order Date'].min(), df['Order Date'].max()]
)

if len(date_range) == 2:
    start_date, end_date = date_range
else:
    start_date = end_date = df['Order Date'].min()
divisions = st.sidebar.multiselect(
    'Division',
    options=df['Division'].unique(),
    default=df['Division'].unique()
)
min_margin = st.sidebar.slider(
    'Minimum Gross Margin %',
    min_value=0,
    max_value=100,
    value=0
)
search_term = st.sidebar.text_input('Search Product Name')
filtered_df = df[
    (df['Order Date'] >= pd.to_datetime(start_date)) &
    (df['Order Date'] <= pd.to_datetime(end_date)) &
    (df['Division'].isin(divisions))
]
if search_term:
    filtered_df = filtered_df[filtered_df['Product Name'].str.contains(search_term, case=False)]
st.header('Product Profitability Overview')
product_summary = filtered_df.groupby('Product Name')[['Sales', 'Units', 'Gross Profit']].sum().reset_index()
product_summary['Gross Margin %'] = product_summary['Gross Profit'] / product_summary['Sales'] * 100
product_summary = product_summary.sort_values('Gross Profit', ascending=False)
product_summary = product_summary[product_summary['Gross Margin %'] >= min_margin]
st.dataframe(product_summary.round(2))
st.bar_chart(product_summary.set_index('Product Name')['Gross Profit'])
st.header('Division Performance Dashboard')
division_summary = filtered_df.groupby('Division')[['Sales', 'Gross Profit']].sum().reset_index()
division_summary['Gross Margin %'] = division_summary['Gross Profit'] / division_summary['Sales'] * 100
st.dataframe(division_summary.round(2))
st.bar_chart(division_summary.set_index('Division')[['Sales', 'Gross Profit']])
st.bar_chart(division_summary.set_index('Division')['Gross Margin %'])
st.header('Cost vs Margin Diagnostics')
fig, ax = plt.subplots()
ax.scatter(filtered_df['Cost'], filtered_df['Sales'])
ax.set_xlabel('Cost')
ax.set_ylabel('Sales')
ax.set_title('Cost vs Sales Across Transactions')
st.pyplot(fig)
low_margin_products = product_summary[product_summary['Gross Margin %'] < 40]
st.write('Products with Gross Margin below 40%:')
st.dataframe(low_margin_products)
st.header('Profit Concentration (Pareto) Analysis')
pareto_df = product_summary.sort_values('Gross Profit', ascending=False).copy()
pareto_df['Cumulative Profit %'] = pareto_df['Gross Profit'].cumsum() / pareto_df['Gross Profit'].sum() * 100
st.dataframe(pareto_df[['Product Name', 'Gross Profit', 'Cumulative Profit %']].round(2))
st.line_chart(pareto_df.set_index('Product Name')['Cumulative Profit %'])
products_for_80 = (pareto_df['Cumulative Profit %'] <= 80).sum() + 1
st.write(f"It takes the top {products_for_80} product(s) to reach 80% of total profit.")
