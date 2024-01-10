forms = ["9BPE", "9JMC", "9RUN", "9LSO", "9HBU", "9IAD", "9CTA", "9GSI"]
prices = ["247", "421.90", "211.95", "71.68", "230.23", "349.98", "126.12", "193.48"]

total = sum(float(i) for i in prices)
total = round(total, 2)
print("The total amount raised is £" + str(total) + "!")
print("Ranks are as followed:")

prices = [float(i) for i in prices]
prices.sort(reverse=True)

combined_list = list(zip(forms, prices))
for index, item in enumerate(combined_list, start=1):
    formatted_price = '{:,.2f}'.format(item[1])
    print(f"{index}. {item[0]} - £{formatted_price}")
