import sys
import itertools

fn = "Sayan"
mn = ""
sn = "Biswas"
by = "2009"
sp = ""

def predict():
  class Prediction():
      
    def main(self, name):
      self.name = name
      return itertools.permutaions([name.upper(), name.lower(), name[0].upper() + name[1:-1].lower() + name[-1].upper(), "".join[char.upper()+name[name.index(char)+1].lower() for char in name if name.index(char) <= len(name) + 1])
    return Prediction().main(name)
    
predict(fn)
    
    
  
