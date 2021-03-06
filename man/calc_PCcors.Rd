% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_PCcors.R
\name{calc_PCcors}
\alias{calc_PCcors}
\title{Calculate correlations of principal components with quality or annotation variables}
\usage{
calc_PCcors(
  PCA_result,
  annotation,
  PCs = 1:10,
  id_col = "libid",
  var_cols,
  ignore_unique_nonnumeric = TRUE,
  ignore_invariant = TRUE,
  date_as_numeric = TRUE,
  min_libs = 5,
  cont_method = "spearman",
  cat_method = "ICC",
  ...
)
}
\arguments{
\item{PCA_result}{result of a principal component analysis, generally of gene expression data. Typically the output of \code{prcomp} or \code{calc_PCAs}. Can also be a matrix with samples in rows and dimensions in columns.}

\item{annotation}{a data frame containing annotation data for the samples. May include clinical data, sample quality metrics, etc.}

\item{PCs}{numeric vector of principal component axes to include in correlation calculations. Defaults to 1:10, which will calculate for the first 10 PCs. Any PCs specified that are not found in the PCA object will not be compared.}

\item{id_col}{name or number of the column of \code{annotation} containing the library identifiers. These are matched to the rownames of \code{PCA_result}. Ignored if \code{PCA_result} does not have rownames.}

\item{var_cols}{numbers or names of columns to include in the correlation calculations. If not specified, all columns will be included, subject to other exclusion criteria.}

\item{ignore_unique_nonnumeric}{logical, whether to drop columns from annotation if they contain unique non-numeric values. Correlations for such variables are meaningless. Defaults to TRUE.}

\item{ignore_invariant}{logical, whether to drop columns from annotation if all non-NA values are identical. Correlations for such variables are meaningless. Defaults to TRUE.}

\item{date_as_numeric}{logical, whether to treat data of class "Date" and "POSIXt" as numeric. If set to FALSE, dates are treated as categorical variables.}

\item{min_libs}{number, the minimum number of libraries containing non-NA values for a variable. Variables in \code{annotation} with fewer non-NA values will be dropped. Defaults to 5.}

\item{cont_method}{character, the name of the correlation coefficient to use for continuous variables. Passed to \code{stats::cor}, and must be one of "pearson", "kendall", or "spearman", or abbreviations thereof. Defaults to "spearman".}

\item{cat_method}{character, the name of the correlation coefficient to use for categorical variables. Currently, the only acceptable option is "ICC", which uses the intraclass correlation coefficient as implemented in \code{ICC::ICCbare}.}

\item{...}{(optional) additional arguments passed to \code{cor} or other functions.}
}
\value{
a matrix of correlation coefficients, wih the column and row names reflecting the PC axes and annotation variables for which correlations were calculated.
}
\description{
This is a helper function to facilitate calculating correlations of sample-specific variables with principal components (generally from RNAseq data). By default, it uses Spearman (rank) correlations for continuous variables and intraclass correlations (as implemented in \code{ICC::ICCbare}) for categorical variables. The correlation method can be changed for continuous variables, but not currently for categorical variables.
}
