
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BeeGUTS

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-green.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version/BeeGUTS)](https://CRAN.R-project.org/package=BeeGUTS)
[![R-CMD-check](https://github.com/bgoussen/BeeGUTS/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/bgoussen/BeeGUTS/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of BeeGUTS is to analyse the survival toxicity tests performed
for bee species. It can be used to fit a Toxicokinetic-Toxicodynamic
(TKTD) model adapted for bee standard studies (acute oral, acute
contact, and chronic oral studies). The TKTD model used is the General
Unified Threshold model of Survival (GUTS).

## Installation

You can install the released version of BeeGUTS from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("BeeGUTS")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("bgoussen/BeeGUTS")
```

## Documentation

Detailed documentation is available
[here](https://github.com/bgoussen/BeeGUTS/blob/dev-docs/docs/home.md)

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(BeeGUTS)
#> BeeGUTS (Version 1.3.0, packaged on the: )
#> - For execution on a local, multicore CPU with excess RAM we recommend calling
#>       options(mc.cores = parallel::detectCores()-1)
#> - In addition to the functions provided by 'BeeGUTS', we recommend using the packages:
#>    - 'bayesplot' for posterior analysis, model checking, and MCMC diagnostics.
#>    - 'loo' for leave-one-out cross-validation (LOO) using Pareto smoothed
#>        importance sampling (PSIS), comparison of predictive errors between models, and
#>        widely applicable information criterion (WAIC).
file_location <- system.file("extdata", "betacyfluthrin_chronic_ug.txt", package = "BeeGUTS") # Load the path to one of the example file
lsData <- dataGUTS(file_location = file_location, test_type = 'Chronic_Oral', cstConcCal = FALSE) # Read the example file
plot(lsData) # Plot the data
#> [[1]]
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
fit <- fitBeeGUTS(lsData, modelType = "SD", nIter = 3000, nChains = 1) # Fit a SD model. This can take some time...
#> 
#> SAMPLING FOR MODEL 'GUTS_SD' NOW (CHAIN 1).
#> Chain 1: 
#> Chain 1: Gradient evaluation took 0.000401 seconds
#> Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 4.01 seconds.
#> Chain 1: Adjust your expectations accordingly!
#> Chain 1: 
#> Chain 1: 
#> Chain 1: Iteration:    1 / 3000 [  0%]  (Warmup)
#> Chain 1: Iteration:  300 / 3000 [ 10%]  (Warmup)
#> Chain 1: Iteration:  600 / 3000 [ 20%]  (Warmup)
#> Chain 1: Iteration:  900 / 3000 [ 30%]  (Warmup)
#> Chain 1: Iteration: 1200 / 3000 [ 40%]  (Warmup)
#> Chain 1: Iteration: 1500 / 3000 [ 50%]  (Warmup)
#> Chain 1: Iteration: 1501 / 3000 [ 50%]  (Sampling)
#> Chain 1: Iteration: 1800 / 3000 [ 60%]  (Sampling)
#> Chain 1: Iteration: 2100 / 3000 [ 70%]  (Sampling)
#> Chain 1: Iteration: 2400 / 3000 [ 80%]  (Sampling)
#> Chain 1: Iteration: 2700 / 3000 [ 90%]  (Sampling)
#> Chain 1: Iteration: 3000 / 3000 [100%]  (Sampling)
#> Chain 1: 
#> Chain 1:  Elapsed Time: 141.899 seconds (Warm-up)
#> Chain 1:                106.124 seconds (Sampling)
#> Chain 1:                248.023 seconds (Total)
#> Chain 1:
traceplot(fit) # Produce a diagnostic plot of the fit
```

<img src="man/figures/README-example-2.png" width="100%" />

``` r
plot(fit) # Plot the fit results
#> [[1]]
```

<img src="man/figures/README-example-3.png" width="100%" />

``` r
summary(fit) # Gives a summary of the results
#> Computing summary can take some time. Please be patient...Summary: 
#> 
#> Bayesian Inference performed with Stan.
#>  Model type: SD 
#>  Bee species: Honey_Bee 
#> 
#>  MCMC sampling setup (select with '$setupMCMC')
#>  Iterations: 3000 
#>  Warmup iterations: 1500 
#>  Thinning interval: 1 
#>  Number of chains: 1
#> 
#> Priors of the parameters (quantiles) (select with '$Qpriors'):
#> 
#>  parameters      median        Q2.5       Q97.5
#>          hb 8.32763e-03 1.09309e-04 6.34432e-01
#>          kd 2.62826e-03 1.17073e-06 5.90041e+00
#>          zw 8.24621e-03 1.19783e-06 5.67693e+01
#>          bw 1.84061e-03 1.69711e-06 1.99625e+00
#> 
#> Posteriors of the parameters (quantiles) (select with '$Qposteriors'):
#> 
#>  parameters      median        Q2.5       Q97.5
#>       hb[1] 7.01822e-03 4.11649e-03 1.02855e-02
#>  parameters      median        Q2.5       Q97.5
#>          kd 9.84329e-01 7.11145e-01 1.62671e+00
#>          zw 9.47394e+00 6.69596e+00 1.06831e+01
#>          bw 8.94078e-03 7.11622e-03 1.06966e-02
#> 
#> 
#>  Maximum Rhat computed (na.rm = TRUE): 1.009446 
#>  Minimum Bulk_ESS: 324 
#>  Minimum Tail_ESS: 171 
#>  Bulk_ESS and Tail_ESS are crude measures of effecting sampling size for
#>       bulk and tail quantities respectively. An ESS > 100 per chain can be
#>       considered as a good indicator. Rhat is an indicator of chains convergence.
#>       A Rhat <= 1.05 is a good indicator of convergence. For detail results,
#>       one can call 'rstan::monitor(YOUR_beeSurvFit_OBJECT$stanFit)
#> 
#>  EFSA Criteria (PPC, NRMSE, and SPPE) can be accessed via 'x$EFSA'
validation <- validate(fit, lsData, fithb = TRUE) # produce a validation of the fit after refitting background mortality from the control data (here it uses the same dataset as calibration as an example, so not relevant…)
#> Fitting the background mortality parameter on the control data of the
#>         validation dataset.
#> Warning in lsOUT$nDatasets <- nDatasets: Wandle linke Seite in eine Liste um
#> 
#> SAMPLING FOR MODEL 'GUTS_hb_only' NOW (CHAIN 1).
#> Chain 1: 
#> Chain 1: Gradient evaluation took 1.3e-05 seconds
#> Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.13 seconds.
#> Chain 1: Adjust your expectations accordingly!
#> Chain 1: 
#> Chain 1: 
#> Chain 1: Iteration:    1 / 3000 [  0%]  (Warmup)
#> Chain 1: Iteration:  300 / 3000 [ 10%]  (Warmup)
#> Chain 1: Iteration:  600 / 3000 [ 20%]  (Warmup)
#> Chain 1: Iteration:  900 / 3000 [ 30%]  (Warmup)
#> Chain 1: Iteration: 1200 / 3000 [ 40%]  (Warmup)
#> Chain 1: Iteration: 1500 / 3000 [ 50%]  (Warmup)
#> Chain 1: Iteration: 1501 / 3000 [ 50%]  (Sampling)
#> Chain 1: Iteration: 1800 / 3000 [ 60%]  (Sampling)
#> Chain 1: Iteration: 2100 / 3000 [ 70%]  (Sampling)
#> Chain 1: Iteration: 2400 / 3000 [ 80%]  (Sampling)
#> Chain 1: Iteration: 2700 / 3000 [ 90%]  (Sampling)
#> Chain 1: Iteration: 3000 / 3000 [100%]  (Sampling)
#> Chain 1: 
#> Chain 1:  Elapsed Time: 0.088 seconds (Warm-up)
#> Chain 1:                0.07 seconds (Sampling)
#> Chain 1:                0.158 seconds (Total)
#> Chain 1: 
#> Bayesian Inference performed with Stan.
#>  MCMC sampling setup (select with '$setupMCMC')
#>  Iterations: 3000 
#>  Warmup iterations: 1500 
#>  Thinning interval: 1 
#>  Number of chains: 1 
#> 
#> Maximum Rhat computed (na.rm = TRUE): 1.002137 
#>  Minimum Bulk_ESS: 487 
#>  Minimum Tail_ESS: 522 
#>  Bulk_ESS and Tail_ESS are crude measures of effecting sampling size for
#>       bulk and tail quantities respectively. An ESS > 100 per chain can be
#>       considered as a good indicator. Rhat is an indicator of chains convergence.
#>       A Rhat <= 1.05 is a good indicator of convergence. For detail results,
#>       one can call 'rstan::monitor(beeSurvValidation$hbfit) 
#> 
#> Results for hb: 
#>  parameters      median         Q2.5       Q97.5
#>          hb 0.002403875 0.0006760675 0.006101959
#> Note that computing can be quite long (several minutes).
#>   Tips: To reduce that time you can reduce Number of MCMC chains (default mcmc_size is set to 1000).
plot(validation) # plot the validation results
```

<img src="man/figures/README-example-4.png" width="100%" />

``` r
dataPredict <- data.frame(time = c(1:5, 1:15), conc = c(rep(5, 5), rep(15, 15)),  replicate = c(rep("rep1", 5), rep("rep3", 15))) # Prepare data for forwards prediction
prediction <- predict(fit, dataPredict) # Perform forwards prediction. At the moment, no concentration recalculation is performed in the forwards prediction. The concentrations are taken as in a chronic test
plot(prediction) # Plot of the prediction results
```

<img src="man/figures/README-example-5.png" width="100%" />
