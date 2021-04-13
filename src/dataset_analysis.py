#!/usr/bin/python

from pandas import read_csv
from pandas.plotting import scatter_matrix
from matplotlib import pyplot


import sys

def main():
    # print command line arguments
  dataset_path = sys.argv[1]
  output_path = sys.argv[2]
  # Load dataset
  #url = "https://raw.githubusercontent.com/jbrownlee/Datasets/master/iris.csv"
  names = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
  dataset = read_csv(dataset_path, names=names)
  dataset.plot(kind='box', subplots=True, layout=(2,2), sharex=False, sharey=False)
  pyplot.show()
  pyplot.savefig(output_path + '/dataset.png')
  # histograms
  dataset.hist()
  pyplot.show()
  pyplot.savefig(output_path + '/histo.png')
  # scatter plot matrix
  scatter_matrix(dataset)
  pyplot.show()
  pyplot.savefig(output_path + '/scattermatrix.png')

if __name__ == "__main__":
    main()
