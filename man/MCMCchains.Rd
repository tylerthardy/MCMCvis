% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MCMCchains.R
\name{MCMCchains}
\alias{MCMCchains}
\title{Extract posterior chains from MCMC output}
\usage{
MCMCchains(object, params = "all", excl = NULL, ISB = TRUE,
  mcmc.list = FALSE)
}
\arguments{
\item{object}{Object containing MCMC output. See DETAILS below.}

\item{params}{Character string (or vector of character strings) denoting parameters of interest.

Default \code{'all'} returns chains for all parameters.}

\item{excl}{Character string (or vector of character strings) denoting parameters to exclude. Used in conjunction with \code{params} argument to select parameters of interest.}

\item{ISB}{Ignore Square Brackets (ISB). Logical specifying whether square brackets should be ignored in the \code{params} and \code{excl} arguments. If \code{TRUE}, square brackets are ignored - input from \code{params} and \code{excl} are otherwise matched exactly. If \code{FALSE}, square brackets are not ignored - input from \code{params} and \code{excl} are matched using regular expression format. This allows partial names to be used when specifying parameters of interest.}

\item{mcmc.list}{Logical specifying whether to return an mcmc.list. If \code{TRUE}, an \code{mcmc.list} object is returned, rather than a matrix.}
}
\description{
Extract posterior chains from MCMC output for specific parameters of interest.
}
\section{Details}{

Function returns matrix with one chain per column for specified parameters. Multiple input chains for each parameter are combined to one posterior chain. Parameters are arranged in columns alphabetically.

\code{object} argument can be a \code{stanfit} object (\code{rstan} package), an \code{mcmc.list} object (\code{coda} package), an \code{R2jags} model object (\code{R2jags} package), a \code{jagsUI} model object (\code{jagsUI} package), or a matrix containing MCMC chains (each column representing MCMC output for a single parameter, rows representing iterations in the chain). The function automatically detects the object type and proceeds accordingly.
}

\examples{
#Load data
data(MCMC_data)

#Extract MCMC chains
ex <- MCMCchains(MCMC_data)
apply(ex, 2, mean)

#Extract MCMC chains for just 'beta' parameters
ex2 <- MCMCchains(MCMC_data, params = 'beta')
apply(ex2, 2, mean)

#Just 'beta[1]', 'beta[4]', and 'alpha[3]'
#'params' takes regular expressions when ISB = FALSE, square brackets must be escaped with '\\\\'
ex3 <- MCMCchains(MCMC_data, params = c('beta\\\\[1\\\\]', 'beta\\\\[4\\\\]', 'alpha\\\\[3\\\\]'), ISB = FALSE)
apply(ex3, 2, sd)

}
