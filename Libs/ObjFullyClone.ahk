; ObjFullyClone
	; problem: https://autohotkey.com/boards/viewtopic.php?t=24457
	; fix (this function): https://autohotkey.com/board/topic/69542-objectclone-doesnt-create-a-copy-keeps-references/?p=440435
ObjFullyClone(obj)
{
	nobj := obj.Clone()
	for k,v in nobj
		if IsObject(v)
			nobj[k] := A_ThisFunc.(v)
	return nobj
}