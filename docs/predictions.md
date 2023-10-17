Model predictions
================
2023-10-13

Back to [home](./home.md)

## Model predictions

``` r
dataPredict <- data.frame(time = c(1:15),
                          conc = c(rep(15,5), rep(0,5), rep(15,5)),
                          replicate = c(rep("pred1", 15)))


pred_res <- predict(fitSD, dataPredict)

plot(pred_res)
```

<img src="figures/DOCS-unnamed-chunk-1-1.png" width="75%" />
