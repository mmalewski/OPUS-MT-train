
#-------------------------------------------------------------------
# wikimedia tasks
#-------------------------------------------------------------------

as-en:
	${MAKE} data-as-en
	${MAKE} train-dynamic-as-en
	${MAKE} reverse-data-as-en
	${MAKE} train-dynamic-en-as

# ENAS_BPE = 4000
ENAS_BPE = 1000

%-as-en:
	${MAKE} HELDOUTSIZE=0 DEVSIZE=1000 TESTSIZE=1000 DEVMINSIZE=100 BPESIZE=${ENAS_BPE} \
		SRCLANGS="as" TRGLANGS="en" \
	${@:-as-en=}

%-en-as:
	${MAKE} HELDOUTSIZE=0 DEVSIZE=1000 TESTSIZE=1000 DEVMINSIZE=100 BPESIZE=${ENAS_BPE} \
		SRCLANGS="en" TRGLANGS="as" \
	${@:-en-as=}


