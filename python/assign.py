
import pandas as pd


df = pd.DataFrame({
    "name": ["Alice", "Bobby", "Charleigh"],
    "age": [25, 30, 3]
})

#df2 = df.assign(
#    age_plus_ten = df["age"] + 10
#)

df2 = df.assign(
    age_plus_ten = lambda x: x["age"] + 10,
    age_times_two = lambda x: x["age"] * 2
)

print(df2)

sales = pd.DataFrame({
    "price": [10, 20, 5],
    "quantity": [3, 1, 10]
})


sales2 = (
    sales
    .assign(
        total=lambda x: x.price * x.quantity,
        discount=lambda x: x.total * 0.1,
        final_total=lambda x: x.total - x.discount
    )
)

print(sales2)
