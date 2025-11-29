import pandas as pd 
import numpy as np
from datetime import timedelta
from sklearn.linear_model import LinearRegression

def projecao_media(dados_historico, projecao=30):
    
    if len(dados_historico) < 2:
        return None
    
    dados = dados_historico.sort_values('data')