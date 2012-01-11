;;;
;;; Copyright (c) 2011 Genome Research Ltd. All rights reserved.
;;;
;;; This file is part of genotype-call.
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;

(in-package :uk.ac.sanger.genotype-call)

;;; Illuminus input format
;;; SNP Coor Alleles 1A 1B 2A 2B ... nA nB

(defun write-illuminus-header (sample-names stream)
  (write-string "SNP" stream)
  (write-char #\Tab stream)
  (write-string "Coor" stream)
  (write-char #\Tab stream)
  (write-string "Alleles" stream)
  (loop
     for name across sample-names
     do (progn
          (write-char #\Tab stream)
          (write-string name stream)
          (write-char #\A stream)
          (write-char #\Tab stream)
          (write-string name stream)
          (write-char #\B stream)))
  (terpri stream))

(defun write-illuminus-snp (snp stream)
  (write-string (snp-name snp) stream)
  (write-char #\Tab stream)
  (princ (snp-position snp) stream)
  (write-char #\Tab stream)
  (write-string (snp-alleles snp) stream))

(defun write-illuminus-intensities (a b stream)
  (write-char #\Tab stream)
  (format stream "~,3f" a)
  (write-char #\Tab stream)
  (format stream "~,3f" b))