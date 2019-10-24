# A short script to render the Pew example with three input data sets

rmarkdown::render('C:/Users/kolenikovs/Conferences/MAPOR.2017/R with Trent/datasets/Pew/Pew-markdown.Rmd',
                  output_file = 'Pew-June16.html',params=list(data='June16'))
rmarkdown::render('C:/Users/kolenikovs/Conferences/MAPOR.2017/R with Trent/datasets/Pew/Pew-markdown.Rmd',
                  output_file = 'Pew-Oct16.html',params=list(data='Oct16'))
rmarkdown::render('C:/Users/kolenikovs/Conferences/MAPOR.2017/R with Trent/datasets/Pew/Pew-markdown.Rmd',
                  output_file = 'Pew-Aug16.html',params=list(data='Aug16'))
