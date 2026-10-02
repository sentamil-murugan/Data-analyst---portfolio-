import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('Nassau_Candy_Distributor.csv')
df['Order Date'] = pd.to_datetime(df['Order Date'],format = '%d/%m/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'],format = '%d/%m/%Y')
print(df[['Sales','Units','Gross Profit','Cost']].describe())
print(df.head())
print((df['Sales'] <= 0).sum())
print((df['Units'] <= 0).sum())
print((df['Gross Profit'] <= 0).sum())
print((df['Cost'] <= 0).sum())
print(df[df['Cost'] == df['Cost'].max()])
df['Calc_GP'] = df['Sales'] - df['Cost']
print((df['Calc_GP'] - df['Gross Profit']).abs().max())
print(df.duplicated().sum())
print(df['Division'].unique())
print(df['Product Name'].unique())
print(df['Order Date'].min() , df['Order Date'].max())
product_df = df.groupby('Product Name')[['Sales','Units','Gross Profit','Cost']].sum().reset_index()
product_df['Gross Margin %'] = product_df['Gross Profit'] / product_df['Sales'] * 100
product_df['profit per unit']= product_df['Gross Profit'] / product_df['Units']
product_df['Revenue Contribution %'] = product_df['Sales'] / product_df['Sales'].sum() * 100
product_df['Profit Contribution %'] = product_df['Gross Profit'] / product_df['Gross Profit'].sum() * 100
print(product_df.round(2).sort_values('Gross Profit', ascending=False))
print(product_df[['Product Name', 'Gross Margin %', 'Sales', 'Gross Profit']].round(2).sort_values('Gross Margin %', ascending=False))
division_df = df.groupby('Division')[['Sales','Units','Gross Profit','Cost']].sum().reset_index()
division_df['Gross Margin %'] = division_df['Gross Profit'] / division_df['Sales'] * 100
division_df['profit per unit']= division_df['Gross Profit'] / division_df['Units']
division_df['Revenue Contribution %'] = division_df['Sales'] / division_df['Sales'].sum() * 100
division_df['Profit Contribution %'] = division_df['Gross Profit'] / division_df['Gross Profit'].sum() * 100
print(division_df.round(2).sort_values('Gross Profit', ascending=False))
print(df[df['Division'] == 'Other'].groupby('Product Name')[['Sales','Gross Profit']].sum())
product_df = product_df.sort_values('Gross Profit', ascending=False)
product_df['Cumulative Profit'] = product_df['Gross Profit'].cumsum()
product_df['Cumulative Profit %'] = product_df['Cumulative Profit'] / product_df['Gross Profit'].sum() * 100
print(product_df[['Product Name', 'Gross Profit', 'Cumulative Profit %']].round(2))
product_df = product_df.sort_values('Sales', ascending=False)
product_df['Cumulative Sales %'] = product_df['Sales'].cumsum() / product_df['Sales'].sum() * 100
print(product_df[['Product Name', 'Sales', 'Cumulative Sales %']].round(2))
plt.scatter(df['Cost'], df['Sales'])
plt.xlabel('Cost')
plt.ylabel('Sales')
plt.title('Relating Costs and Sales across all transactions')
plt.show()
