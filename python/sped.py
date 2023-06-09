import speedtest
from tqdm import tqdm

s = speedtest.Speedtest()
bytes = 1000000

LENGTH = 10 # Number of iterations required to fill pbar


pbar = tqdm(total=LENGTH) # Init pbar

for i in range(LENGTH):
  pbar.update(n=1) # Increments counter


dws = round(s.download()/bytes,2)

ups = round(s.upload()/bytes,2)

print(f"donwload speed is: {dws} Mbps")

print(f"upload speed is: {ups} Mbps")
