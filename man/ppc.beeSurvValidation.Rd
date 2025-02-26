% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ppc.R
\name{ppc.beeSurvValidation}
\alias{ppc.beeSurvValidation}
\title{Posterior predictive check method for \code{beeSurvValidation} objects}
\usage{
\method{ppc}{beeSurvValidation}(x)
}
\arguments{
\item{x}{an object of class \code{beeSurvValidation}}
}
\value{
a \code{data.frame} of class \code{ppc}
}
\description{
Posterior predictive check method for \code{beeSurvValidation} objects
}
\examples{
data(fitBetacyfluthrin_Chronic)
data(betacyfluthrinChronic)
valid <- validate(fitBetacyfluthrin_Chronic,betacyfluthrinChronic)
out <- ppc(valid)

}
