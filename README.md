## Sobre os dados

Para este curso utilizaremos dados de partidas que ocorreram nos servidores da Gamers Club. São partidas referentes à 2.500 jogadores, havendo mais de 30 estatísticas de seus partidas. Tais como Abates, Assistências, Mortes, Flash Assist, Head Shot, etc.

Alem disso, temos informações de medalhas destes players, como:
- Assinatura Premium, Plus
- Medalhas da Comunidade

Para ter uma melhor descrição destes dados, confira na [página oficial do Kaggle](https://www.kaggle.com/gamersclub/brazilian-csgo-plataform-dataset-by-gamers-club) onde os dados foram disponibilizados.

Abaixo temos o schema (relacionamentos) dos nossos dados.

<img src="https://user-images.githubusercontent.com/4283625/157664295-45b60786-92a4-478d-a044-478cdc6261d7.jpg" alt="" width="500">

## Setup e requisitos

### 1. Python / Anaconda

Você pode fazer o download do Python no site oficial: [www.python.org/](https://www.python.org/)

Como utilizaremos bibliotecas voltadas à análise de dados e modelagem, sera necessário realizar as instalações destas libs. Assim, por amor a simplicidade, eu recomendo fazer uso do [Anaconda](https://www.anaconda.com/).

A instalação do Anaconda é bem simples, só deve ficar atento em adicionar seu endereço à variável `PATH`.

### 2. Visual Studio Code

Esta ferramenta é uma interface de desenvolvimento. Não é necessária pois e apenas mais um sabor dentre tantos. Porém, como gosto bastante bastante, o curso será conduzido a partir da mesma.

Para instalar o [Visual Studio Code](https://code.visualstudio.com/) basta realizar o download na [página oficial](https://code.visualstudio.com/) da ferramenta e seguir os passos de instalação.

### 2. Dados

Como vamos utilizar os dados da GC, você precisa baixar estes dados de nossa pasta no [google drive](https://drive.google.com/file/d/1QR53whL3BCj6W9zawjMhGhFog-FbAySP/view?usp=sharing).

### 3. Conhecimentos técnicos

Temos como objetivo  ajudar pessoas que estão descobrindo o mundo de dados agora. Como é um curso de Data Science end-to-end, é recomendado que se saiba os conceitos de SQL e familiaridade com Python. Para facilitar o acompanhamento, preparamos um curso de [SQL aqui](https://github.com/TeoCalvo/sql_gc).

Faremos uso das seguintes bibliotecas:
- SQLalchemy
- Pandas
- Numpy
- Scikit-learn
- Feature-engine
- XGBoost
- Scikit-plot
- Yellowbrick
