-------------
-- ����-��� --
-------------

function AntiBotSystem(role)
	local name = GetChaDefaultName(role)
	local CheckBot = CheckBot(role)
	if CheckBot == 0 then
		if AntiBot[name] == nil then
			local X,Y = GetChaPos(role)
			AntiBot[name] = { Pos_X = X , Pos_Y = Y }
			return 1
		end
	elseif CheckBot == 1 then
		return 0
	end
end

function CheckBot(role)
	local name = GetChaDefaultName(role)
	local X,Y = GetChaPos(role)

	if AntiBot[name] ~= nil then
		if AntiBot[name].Pos_X == X and AntiBot[name].Pos_Y == Y then
			--SystemNotice ( role , "���������� ������������ ����� ���� �� ����� �����!" )
			return 1
		else
			AntiBot[name] = nil
			return 0
		end
	else
		return 0
	end
end

function AntiBotSystemLine(role)
	local name = GetChaDefaultName(role)
	local CheckBotLine = CheckBotLine(role)
	local count = 0
	local map = GetChaMapName(role)
	if map == "garner" or map == "magicsea" or map == "darkblue" then
	
		if CheckBotLine == 0 then
			if AntiBotLine[name] == nil then
				local X,Y = GetChaPos(role)
				count = count + 1
				AntiBotLine[name] = { Pos_X = X , Pos_Y = Y, count = count }
				return 1
			elseif AntiBotLine[name] ~= nil then
				count = AntiBotLine[name].count + 1
				X = AntiBotLine[name].Pos_X
				Y = AntiBotLine[name].Pos_Y
				AntiBotLine[name] = { Pos_X = X , Pos_Y = Y, count = count }
				return 1
			end
		elseif CheckBotLine == 1 then
			return 0
		end
	else
		return 1
	end
end

function CheckBotLine(role)
	local name = GetChaDefaultName(role)
	local X,Y = GetChaPos(role)
	if AntiBotLine[name] ~= nil then
	LG("anti-bot", name.." "..AntiBotLine[name].count )
		if AntiBotLine[name].count <= AntiBotCOUNT then
			--SystemNotice(role,"AntiBotLine[name].count <= 3 ")
			if AntiBotLine[name].Pos_X == X and AntiBotLine[name].Pos_Y == Y then
				--SystemNotice(role,"CheckBot ������")
				LG("anti-bot", name.."  ������ ")
				return 0
			else
				LG("anti-bot", name.."   �������� ��������� ")
				--SystemNotice(role,"CheckBot �������� ���������")
				AntiBotLine[name] = nil
				return 0
			end
		elseif AntiBotLine[name].count > 3 then
			--SystemNotice(role,"AntiBotLine[name].count > 3 ")
			if AntiBotLine[name].Pos_X == X and AntiBotLine[name].Pos_Y == Y then
				LG("anti-bot", name.."  ���������� ������������ ����� ���� �� ����� ����� ")
				--SystemNotice ( role , "���������� ������������ ����� ���� �� ����� �����!" )
				return 1
			else
				LG("anti-bot", name.."   �������� ��������� ")
				--SystemNotice(role,"CheckBot �������� ���������")
				AntiBotLine[name] = nil
				return 0
			end
		end
	else
		return 0
	end
end


--		�������� ������		
skill_coldown = {}																																																																																																			
skill_coldown[	1	]=	0 -- 	1	���� �����																																																																																																					
skill_coldown[	2	]=	400 -- 	2	���������� ����																																																																																																					
skill_coldown[	3	]=	400 -- 	3	���������� ����																																																																																																					
skill_coldown[	4	]=	0 -- 	4	����� ���� �������																																																																																																					
skill_coldown[	5	]=	0 -- 	5	�������� ������																																																																																																					
skill_coldown[	6	]=	400 -- 	6	������� ������																																																																																																					
skill_coldown[	7	]=	0 -- 	7	�������� �������																																																																																																					
skill_coldown[	8	]=	0 -- 	8	������������ �������																																																																																																					
skill_coldown[	9	]=	0 -- 	9	���������� ���																																																																																																					
skill_coldown[	10	]=	0 -- 	10	�������� ����																																																																																																					
skill_coldown[	11	]=	0 -- 	11	�������� ����																																																																																																					
skill_coldown[	12	]=	0 -- 	12	�������� �����																																																																																																					
skill_coldown[	13	]=	0 -- 	13	������																																																																																																					
skill_coldown[	14	]=	0 -- 	14	����������																																																																																																					
skill_coldown[	15	]=	0 -- 	15	������ �����																																																																																																					
skill_coldown[	16	]=	0 -- 	16	������																																																																																																					
skill_coldown[	17	]=	0 -- 	17	��������� ���																																																																																																					
skill_coldown[	18	]=	0 -- 	18	�����-���������																																																																																																					
skill_coldown[	19	]=	0 -- 	19	�������������																																																																																																					
skill_coldown[	20	]=	0 -- 	20	����������																																																																																																					
skill_coldown[	22	]=	0 -- 	22	������ ������																																																																																																					
skill_coldown[	23	]=	0 -- 	23	����������� ������																																																																																																					
skill_coldown[	24	]=	0 -- 	24	�������� ���																																																																																																					
skill_coldown[	25	]=	0 -- 	25	����� ����																																																																																																					
skill_coldown[	26	]=	400 -- 	26	������� �����																																																																																																					
skill_coldown[	27	]=	400 -- 	27	������� �����																																																																																																					
skill_coldown[	28	]=	0 -- 	28	���																																																																																																					
skill_coldown[	29	]=	0 -- 	29	������� ���																																																																																																					
skill_coldown[	30	]=	0 -- 	30	���																																																																																																					
skill_coldown[	31	]=	0 -- 	31	������																																																																																																					
skill_coldown[	32	]=	0 -- 	32	������																																																																																																					
skill_coldown[	33	]=	0 -- 	33	���������� ��������																																																																																																					
skill_coldown[	34	]=	0 -- 	34	������																																																																																																					
skill_coldown[	35	]=	0 -- 	35	������� � �������																																																																																																					
skill_coldown[	36	]=	0 -- 	36	�������� �����																																																																																																					
skill_coldown[	37	]=	0 -- 	37	�����																																																																																																					
skill_coldown[	38	]=	0 -- 	38	��������� ������																																																																																																					
skill_coldown[	39	]=	0 -- 	39	�����������																																																																																																					
skill_coldown[	40	]=	0 -- 	40	����������� � ��������																																																																																																					
skill_coldown[	42	]=	0 -- 	42	����� ������																																																																																																					
skill_coldown[	43	]=	400 -- 	43	�������� ����																																																																																																					
skill_coldown[	44	]=	0 -- 	44	������������ �������������� ������																																																																																																					
skill_coldown[	45	]=	400 -- 	45	���������� �������������																																																																																																					
skill_coldown[	46	]=	0 -- 	46	���� �� ����																																																																																																					
skill_coldown[	47	]=	0 -- 	47	����� ���� �������																																																																																																					
skill_coldown[	48	]=	400 -- 	48	�������																																																																																																					
skill_coldown[	49	]=	0 -- 	49	������																																																																																																					
skill_coldown[	50	]=	0 -- 	50	����������������� ���																																																																																																					
skill_coldown[	51	]=	0 -- 	51	��� ������																																																																																																					
skill_coldown[	52	]=	0 -- 	52	��������� �����																																																																																																					
skill_coldown[	53	]=	0 -- 	53	�������� �����																																																																																																					
skill_coldown[	54	]=	400 -- 	54	���������� �������������																																																																																																					
skill_coldown[	55	]=	400 -- 	55	�������������																																																																																																					
skill_coldown[	56	]=	400 -- 	56	������ ������																																																																																																					
skill_coldown[	57	]=	400 -- 	57	��������� ���																																																																																																					
skill_coldown[	58	]=	400 -- 	58	������ ����������																																																																																																					
skill_coldown[	59	]=	400 -- 	59	��� �����																																																																																																					
skill_coldown[	60	]=	400 -- 	60	�����������																																																																																																					
skill_coldown[	61	]=	400 -- 	61	������ �����																																																																																																					
skill_coldown[	62	]=	400 -- 	62	��������� ������� �����																																																																																																					
skill_coldown[	63	]=	400 -- 	63	�������� ����																																																																																																					
skill_coldown[	64	]=	400 -- 	64	��������																																																																																																					
skill_coldown[	65	]=	0 -- 	65	��������																																																																																																					
skill_coldown[	66	]=	0 -- 	66	������������																																																																																																					
skill_coldown[	67	]=	0 -- 	67	������ �������� ����																																																																																																					
skill_coldown[	68	]=	400 -- 	68	�������� ���																																																																																																					
skill_coldown[	69	]=	0 -- 	69	����������																																																																																																					
skill_coldown[	70	]=	0 -- 	70	�������� �������																																																																																																					
skill_coldown[	71	]=	0 -- 	71	�������� ����																																																																																																					
skill_coldown[	72	]=	0 -- 	72	���������������																																																																																																					
skill_coldown[	73	]=	400 -- 	73	�������� �����																																																																																																					
skill_coldown[	74	]=	400 -- 	74	������ ����������� ������																																																																																																					
skill_coldown[	75	]=	400 -- 	75	���� �����																																																																																																					
skill_coldown[	76	]=	400 -- 	76	��������																																																																																																					
skill_coldown[	77	]=	400 -- 	77	��������� ��������																																																																																																					
skill_coldown[	78	]=	0 -- 	78	������ �������������� ������																																																																																																					
skill_coldown[	79	]=	0 -- 	79	����																																																																																																					
skill_coldown[	80	]=	400 -- 	80	��������� ��������																																																																																																					
skill_coldown[	81	]=	400 -- 	81	���������� ����																																																																																																					
skill_coldown[	82	]=	400 -- 	82	������� ����																																																																																																					
skill_coldown[	83	]=	400 -- 	83	����������� ������																																																																																																					
skill_coldown[	84	]=	400 -- 	84	�������																																																																																																					
skill_coldown[	85	]=	400 -- 	85	���� � �����																																																																																																					
skill_coldown[	86	]=	400 -- 	86	������� ����																																																																																																					
skill_coldown[	87	]=	400 -- 	87	�������� ������																																																																																																					
skill_coldown[	88	]=	0 -- 	88	����������																																																																																																					
skill_coldown[	89	]=	0 -- 	89	���� ����																																																																																																					
skill_coldown[	90	]=	400 -- 	90	������� �������																																																																																																					
skill_coldown[	91	]=	400 -- 	91	��������� ����																																																																																																					
skill_coldown[	92	]=	400 -- 	92	�������� ����																																																																																																					
skill_coldown[	93	]=	400 -- 	93	������� ������																																																																																																					
skill_coldown[	94	]=	400 -- 	94	��������� �������																																																																																																					
skill_coldown[	95	]=	400 -- 	95	����������																																																																																																					
skill_coldown[	96	]=	400 -- 	96	������� � ������																																																																																																					
skill_coldown[	97	]=	400 -- 	97	���������																																																																																																					
skill_coldown[	98	]=	400 -- 	98	��������������																																																																																																					
skill_coldown[	99	]=	400 -- 	99	���������� ����																																																																																																					
skill_coldown[	100	]=	400 -- 	100	���������� �����																																																																																																					
skill_coldown[	101	]=	400 -- 	101	���� ����																																																																																																					
skill_coldown[	102	]=	400 -- 	102	������� �������																																																																																																					
skill_coldown[	103	]=	400 -- 	103	���������� ���																																																																																																					
skill_coldown[	104	]=	400 -- 	104	������ ����������																																																																																																					
skill_coldown[	105	]=	400 -- 	105	������� ����																																																																																																					
skill_coldown[	106	]=	400 -- 	106	���������� ���																																																																																																					
skill_coldown[	107	]=	400 -- 	107	���																																																																																																					
skill_coldown[	108	]=	400 -- 	108	���������� ���������																																																																																																					
skill_coldown[	109	]=	400 -- 	109	����� ����� ������																																																																																																					
skill_coldown[	110	]=	0 -- 	110	�������� ���																																																																																																					
skill_coldown[	111	]=	0 -- 	111	�����������																																																																																																					
skill_coldown[	112	]=	400 -- 	112	����������� �����																																																																																																					
skill_coldown[	113	]=	400 -- 	113	������������� ����																																																																																																					
skill_coldown[	114	]=	0 -- 	114	�����																																																																																																					
skill_coldown[	115	]=	400 -- 	115	����������� ����																																																																																																					
skill_coldown[	116	]=	400 -- 	116	�������� ������																																																																																																					
skill_coldown[	117	]=	400 -- 	117	������� ���������																																																																																																					
skill_coldown[	118	]=	400 -- 	118	������ ��������������																																																																																																					
skill_coldown[	119	]=	400 -- 	119	��������� �����																																																																																																					
skill_coldown[	120	]=	400 -- 	120	���������																																																																																																					
skill_coldown[	121	]=	400 -- 	121	��������� ������																																																																																																					
skill_coldown[	122	]=	400 -- 	122	���������� ��������																																																																																																					
skill_coldown[	123	]=	400 -- 	123	����������																																																																																																					
skill_coldown[	124	]=	400 -- 	124	�����������																																																																																																					
skill_coldown[	125	]=	400 -- 	125	���������� ������																																																																																																					
skill_coldown[	126	]=	0 -- 	126	������������ ������																																																																																																					
skill_coldown[	127	]=	400 -- 	127	��� �����																																																																																																					
skill_coldown[	128	]=	0 -- 	128	����� �����																																																																																																					
skill_coldown[	129	]=	0 -- 	129	���� �������																																																																																																					
skill_coldown[	130	]=	0 -- 	130	������ ����																																																																																																					
skill_coldown[	131	]=	0 -- 	131	���������� ����� �����																																																																																																					
skill_coldown[	132	]=	0 -- 	132	���������� ���� ����������� ����������																																																																																																					
skill_coldown[	133	]=	0 -- 	133	���������� ���� �����																																																																																																					
skill_coldown[	134	]=	0 -- 	134	�������																																																																																																					
skill_coldown[	135	]=	0 -- 	135	���������� �������																																																																																																					
skill_coldown[	136	]=	0 -- 	136	������� �������� �������																																																																																																					
skill_coldown[	137	]=	0 -- 	137	������� ������																																																																																																					
skill_coldown[	138	]=	0 -- 	138	������ ����																																																																																																					
skill_coldown[	139	]=	0 -- 	139	����� ������� ��������																																																																																																					
skill_coldown[	140	]=	0 -- 	140	�������� ��� �����																																																																																																					
skill_coldown[	141	]=	0 -- 	141	������ ���������																																																																																																					
skill_coldown[	142	]=	0 -- 	142	�������� ��� ����������� ������																																																																																																					
skill_coldown[	143	]=	0 -- 	143	������� ����� ������������ ��������																																																																																																					
skill_coldown[	144	]=	0 -- 	144	������ �����-������																																																																																																					
skill_coldown[	145	]=	0 -- 	145	������ �������																																																																																																					
skill_coldown[	146	]=	0 -- 	146	�������� ��������																																																																																																					
skill_coldown[	147	]=	0 -- 	147	����� ����������� ��������																																																																																																					
skill_coldown[	148	]=	0 -- 	148	������ ������ ����������																																																																																																					
skill_coldown[	149	]=	0 -- 	149	����� �����������																																																																																																					
skill_coldown[	150	]=	0 -- 	150	���� �������																																																																																																					
skill_coldown[	151	]=	0 -- 	151	�����-���������																																																																																																					
skill_coldown[	152	]=	0 -- 	152	���� ������																																																																																																					
skill_coldown[	153	]=	0 -- 	153	����� ������� ��������																																																																																																					
skill_coldown[	154	]=	0 -- 	154	����� ��������� ������																																																																																																																																																																																																									
skill_coldown[	199	]=	0 -- 	199	����																																																																																																					
skill_coldown[	200	]=	0 -- 	200	����� ����																																																																																																					
skill_coldown[	201	]=	0 -- 	201	������ ����																																																																																																					
skill_coldown[	202	]=	400 -- 	202	�����																																																																																																					
skill_coldown[	210	]=	400 -- 	210	�������																																																																																																					
skill_coldown[	211	]=	400 -- 	211	�������																																																																																																					
skill_coldown[	212	]=	400 -- 	212	����� �� �������																																																																																																					
skill_coldown[	213	]=	400 -- 	213	�������																																																																																																					
skill_coldown[	214	]=	400 -- 	214	������																																																																																																					
skill_coldown[	215	]=	400 -- 	215	������������ ����������																																																																																																					
skill_coldown[	216	]=	400 -- 	216	���������� ���																																																																																																					
skill_coldown[	217	]=	400 -- 	217	�������� �����																																																																																																					
skill_coldown[	218	]=	400 -- 	218	�����																																																																																																					
skill_coldown[	219	]=	400 -- 	219	�����																																																																																																					
skill_coldown[	220	]=	400 -- 	220	�������� ������																																																																																																					
skill_coldown[	222	]=	400 -- 	222	��������																																																																																																					
skill_coldown[	223	]=	400 -- 	223	�������������																																																																																																					
skill_coldown[	224	]=	400 -- 	224	����������� ������																																																																																																					
skill_coldown[	225	]=	400 -- 	225	�������																																																																																																					
skill_coldown[	226	]=	0 -- 	226	���������� ��������																																																																																																					
skill_coldown[	227	]=	0 -- 	227	������. �����. �����������																																																																																																					
skill_coldown[	228	]=	0 -- 	228	�����������																																																																																																					
skill_coldown[	229	]=	0 -- 	229	�������� �������																																																																																																					
skill_coldown[	230	]=	0 -- 	230	��������� ���������� ����																																																																																																					
skill_coldown[	231	]=	0 -- 	231	�����������																																																																																																					
skill_coldown[	232	]=	0 -- 	232	��������																																																																																																					
skill_coldown[	233	]=	0 -- 	233	����������																																																																																																					
skill_coldown[	234	]=	0 -- 	234	���� ������																																																																																																					
skill_coldown[	235	]=	0 -- 	235	�������� ������																																																																																																					
skill_coldown[	236	]=	0 -- 	236	������																																																																																																					
skill_coldown[	237	]=	0 -- 	237	�������������																																																																																																					
skill_coldown[	238	]=	0 -- 	238	���� �������																																																																																																					
skill_coldown[	239	]=	0 -- 	239	������� ������																																																																																																					
skill_coldown[	240	]=	0 -- 	240	����������� ������																																																																																																					
skill_coldown[	241	]=	0 -- 	241	��������� �����																																																																																																					
skill_coldown[	242	]=	400 -- 	242	��������																																																																																																					
skill_coldown[	243	]=	400 -- 	243	���																																																																																																					
skill_coldown[	244	]=	400 -- 	244	�����																																																																																																					
skill_coldown[	245	]=	0 -- 	245	������� ������� ���������																																																																																																					
skill_coldown[	246	]=	0 -- 	246	������������� ������ ������																																																																																																					
skill_coldown[	247	]=	0 -- 	247	������������ ���� ��������																																																																																																					
skill_coldown[	248	]=	0 -- 	248	����� �����																																																																																																					
skill_coldown[	249	]=	0 -- 	249	��������������� ��������																																																																																																					
skill_coldown[	250	]=	0 -- 	250	����������� ������ 1																																																																																																					
skill_coldown[	251	]=	0 -- 	251	����������� ������ 2																																																																																																					
skill_coldown[	252	]=	0 -- 	252	����� ������� ����																																																																																																					
skill_coldown[	253	]=	0 -- 	253	�������� ����																																																																																																					
skill_coldown[	254	]=	0 -- 	254	������																																																																																																					
skill_coldown[	255	]=	400 -- 	255	����������� �������������																																																																																																					
skill_coldown[	256	]=	400 -- 	256	������� �����																																																																																																					
skill_coldown[	257	]=	0 -- 	257	������� �����																																																																																																					
skill_coldown[	258	]=	0 -- 	258	������������� ����� �����																																																																																																					
skill_coldown[	259	]=	0 -- 	259	���������� ������� �����																																																																																																					
skill_coldown[	260	]=	0 -- 	260	���������� ������																																																																																																					
skill_coldown[	261	]=	0 -- 	261	���������																																																																																																					
skill_coldown[	262	]=	0 -- 	262	���������� ����������� ����																																																																																																					
skill_coldown[	263	]=	0 -- 	263	������� �������� ���������� ����������� ����																																																																																																					
skill_coldown[	264	]=	0 -- 	264	������																																																																																																					
skill_coldown[	265	]=	0 -- 	265	���������� ������																																																																																																					
skill_coldown[	266	]=	0 -- 	266	����������� ����																																																																																																					
skill_coldown[	267	]=	0 -- 	267	������� ���																																																																																																					
skill_coldown[	268	]=	0 -- 	268	������� ��																																																																																																					
skill_coldown[	269	]=	0 -- 	269	���� �������� �������																																																																																																					
skill_coldown[	270	]=	0 -- 	270	������� �������																																																																																																					
skill_coldown[	271	]=	0 -- 	271	�������� �������																																																																																																					
skill_coldown[	272	]=	0 -- 	272	��������� �����																																																																																																					
skill_coldown[	273	]=	0 -- 	273	�������� �������																																																																																																					
skill_coldown[	274	]=	0 -- 	274	����� �������� �������																																																																																																					
skill_coldown[	275	]=	0 -- 	275	���� ������� �������																																																																																																					
skill_coldown[	276	]=	0 -- 	276	��� ������� �������																																																																																																					
skill_coldown[	277	]=	0 -- 	277	����� ������� �������																																																																																																					
skill_coldown[	278	]=	0 -- 	278	������� ������� �������																																																																																																					
skill_coldown[	279	]=	400 -- 	279	����������																																																																																																					
skill_coldown[	280	]=	400 -- 	280	���� ���																																																																																																					
skill_coldown[	281	]=	0 -- 	281	��� ������� �������																																																																																																					
skill_coldown[	282	]=	0 -- 	282	������ ������ ������																																																																																																					
skill_coldown[	283	]=	0 -- 	283	������������ ���� ������� ������� 																																																																																																					
skill_coldown[	284	]=	0 -- 	284	�������� ��� ������� �������																																																																																																					
skill_coldown[	285	]=	0 -- 	285	������ ������� �������																																																																																																					
skill_coldown[	286	]=	0 -- 	286	������� ���� ������������� ����																																																																																																					
skill_coldown[	287	]=	0 -- 	287	��������� ������� ����																																																																																																					
skill_coldown[	288	]=	0 -- 	288	����� �������																																																																																																					
skill_coldown[	289	]=	0 -- 	289	������ ������� ����																																																																																																					
skill_coldown[	290	]=	0 -- 	290	�������� ���																																																																																																					
skill_coldown[	291	]=	0 -- 	291	����������� ������ ������� ���																																																																																																					
skill_coldown[	292	]=	0 -- 	292	������ ������� ����																																																																																																					
skill_coldown[	293	]=	0 -- 	293	��������� �����																																																																																																					
skill_coldown[	294	]=	0 -- 	294	����� ������																																																																																																					
skill_coldown[	295	]=	0 -- 	295	����������� ������																																																																																																					
skill_coldown[	296	]=	0 -- 	296	���������� �����������																																																																																																					
skill_coldown[	297	]=	0 -- 	297	��������� ������																																																																																																					
skill_coldown[	298	]=	0 -- 	298	���� �����																																																																																																					
skill_coldown[	299	]=	0 -- 	299	������� ����																																																																																																					
skill_coldown[	301	]=	0 -- 	301	�������� ������� ����																																																																																																					
skill_coldown[	302	]=	0 -- 	302	�������� ������� ���																																																																																																					
skill_coldown[	303	]=	0 -- 	303	��������� �����																																																																																																					
skill_coldown[	304	]=	0 -- 	304	����������������� ������ ����																																																																																																					
skill_coldown[	305	]=	0 -- 	305	������� ���� ������� ������																																																																																																					
skill_coldown[	306	]=	0 -- 	306	����� ������� ����																																																																																																					
skill_coldown[	307	]=	0 -- 	307	������� ���� �������� ������																																																																																																					
skill_coldown[	308	]=	0 -- 	308	������������																																																																																																					
skill_coldown[	309	]=	0 -- 	309	�������� ������																																																																																																					
skill_coldown[	310	]=	0 -- 	310	���������� ������																																																																																																					
skill_coldown[	311	]=	400 -- 	311	���������������																																																																																																					
skill_coldown[	312	]=	400 -- 	312	����� - �������																																																																																																					
skill_coldown[	313	]=	400 -- 	313	����� - �����																																																																																																					
skill_coldown[	314	]=	400 -- 	314	����� - ������																																																																																																					
skill_coldown[	315	]=	400 -- 	315	����� - �������� �����																																																																																																					
skill_coldown[	316	]=	400 -- 	316	����� - �����																																																																																																					
skill_coldown[	317	]=	400 -- 	317	����� - ����																																																																																																					
skill_coldown[	318	]=	400 -- 	318	����� - ������																																																																																																					
skill_coldown[	319	]=	400 -- 	319	����� - ������																																																																																																					
skill_coldown[	320	]=	0 -- 	320	������� �����������																																																																																																					
skill_coldown[	321	]=	0 -- 	321	���������																																																																																																					
skill_coldown[	322	]=	0 -- 	322	������������																																																																																																					
skill_coldown[	323	]=	0 -- 	323	�������																																																																																																					
skill_coldown[	324	]=	0 -- 	324	�������������																																																																																																					
skill_coldown[	325	]=	0 -- 	325	������� ������������� �����																																																																																																					
skill_coldown[	326	]=	0 -- 	326	������� ����������� ����																																																																																																					
skill_coldown[	327	]=	0 -- 	327	������� �������� � ������																																																																																																					
skill_coldown[	328	]=	0 -- 	328	������� ���������� ������																																																																																																					
skill_coldown[	329	]=	400 -- 	329	�������																																																																																																					
skill_coldown[	330	]=	400 -- 	330	���������																																																																																																					
skill_coldown[	331	]=	400 -- 	331	����������																																																																																																					
skill_coldown[	332	]=	400 -- 	332	��������																																																																																																					
skill_coldown[	333	]=	400 -- 	333	���������� ��������																																																																																																					
skill_coldown[	334	]=	400 -- 	334	�����������																																																																																																					
skill_coldown[	335	]=	400 -- 	335	���������																																																																																																					
skill_coldown[	336	]=	400 -- 	336	����������� �����																																																																																																					
skill_coldown[	337	]=	400 -- 	337	����������� �������																																																																																																					
skill_coldown[	338	]=	400 -- 	338	������������																																																																																																					
skill_coldown[	339	]=	400 -- 	339	���������																																																																																																					
skill_coldown[	340	]=	400 -- 	340	�������																																																																																																					
skill_coldown[	341	]=	400 -- 	341	�������������																																																																																																					
skill_coldown[	342	]=	400 -- 	342	������� 2 ��.																																																																																																					
skill_coldown[	343	]=	400 -- 	343	�������� ����� 2 ��.																																																																																																					
skill_coldown[	344	]=	400 -- 	344	���������� 2 ��.																																																																																																					
skill_coldown[	345	]=	400 -- 	345	�������� ���� 2 ��.																																																																																																					
skill_coldown[	346	]=	400 -- 	346	����������� ���������� 2 ��.																																																																																																					
skill_coldown[	347	]=	400 -- 	347	����������� �������� 2 ��.																																																																																																					
skill_coldown[	348	]=	400 -- 	348	����������� ��������� 2 ��.																																																																																																					
skill_coldown[	349	]=	400 -- 	349	����������� ���, 2 ��.																																																																																																					
skill_coldown[	350	]=	400 -- 	350	����������� ������� 2 ��.																																																																																																					
skill_coldown[	351	]=	400 -- 	351	������� 3 ��.																																																																																																					
skill_coldown[	352	]=	400 -- 	352	�������� ����� 3 ��.																																																																																																					
skill_coldown[	353	]=	400 -- 	353	���������� 3 ��.																																																																																																					
skill_coldown[	354	]=	400 -- 	354	�������� ���� 3 ��.																																																																																																					
skill_coldown[	355	]=	400 -- 	355	����������� ���������� 3 ��.																																																																																																					
skill_coldown[	356	]=	400 -- 	356	����������� �������� 3 ��.																																																																																																					
skill_coldown[	357	]=	400 -- 	357	����������� ��������� 3 ��.																																																																																																					
skill_coldown[	358	]=	400 -- 	358	����������� ��� 3 ��.																																																																																																					
skill_coldown[	359	]=	400 -- 	359	����������� ������� 3 ��.																																																																																																					
skill_coldown[	360	]=	400 -- 	360	������� 4 ��.																																																																																																					
skill_coldown[	361	]=	400 -- 	361	�������� ����� 4 ��.																																																																																																					
skill_coldown[	362	]=	400 -- 	362	���������� 4 ��.																																																																																																					
skill_coldown[	363	]=	400 -- 	363	�������� ���� 4 ��.																																																																																																					
skill_coldown[	364	]=	400 -- 	364	����������� ���������� 4 ��.																																																																																																					
skill_coldown[	365	]=	400 -- 	365	����������� �������� 4 ��.																																																																																																					
skill_coldown[	366	]=	400 -- 	366	����������� ��������� 4 ��.																																																																																																					
skill_coldown[	367	]=	400 -- 	367	����������� ��� 4 ��.																																																																																																					
skill_coldown[	368	]=	400 -- 	368	����������� ������� 4 ��.																																																																																																					
skill_coldown[	369	]=	400 -- 	369	������� 5 ��.																																																																																																					
skill_coldown[	370	]=	400 -- 	370	�������� ����� 5 ��.																																																																																																					
skill_coldown[	371	]=	400 -- 	371	���������� 5 ��.																																																																																																					
skill_coldown[	372	]=	400 -- 	372	�������� ����, 5 ��.																																																																																																					
skill_coldown[	373	]=	400 -- 	373	����������� ���������� 5 ��.																																																																																																					
skill_coldown[	374	]=	400 -- 	374	����������� �������� 5 ��.																																																																																																					
skill_coldown[	375	]=	400 -- 	375	����������� ��������� 5 ��.																																																																																																					
skill_coldown[	376	]=	400 -- 	376	����������� ��� 5 ��.																																																																																																					
skill_coldown[	377	]=	400 -- 	377	����������� ������� 5 ��.																																																																																																					
skill_coldown[	378	]=	400 -- 	378	������																																																																																																					
skill_coldown[	379	]=	400 -- 	379	������� ���� 1 ��.																																																																																																					
skill_coldown[	380	]=	400 -- 	380	�������� ���� 1 ��.																																																																																																					
skill_coldown[	381	]=	400 -- 	381	��������� ������������� 1 ��.																																																																																																					
skill_coldown[	382	]=	400 -- 	382	���������� ���� 1 ��.																																																																																																					
skill_coldown[	383	]=	400 -- 	383	��������� ������ 1 ��.																																																																																																					
skill_coldown[	384	]=	400 -- 	384	�������� ������� 1 ��.																																																																																																					
skill_coldown[	385	]=	400 -- 	385	�����, 1 ��.																																																																																																					
skill_coldown[	386	]=	400 -- 	386	������ ������� 1 ��.																																																																																																					
skill_coldown[	387	]=	400 -- 	387	�������� ��� 1 ��.																																																																																																					
skill_coldown[	388	]=	400 -- 	388	������� ���� 1 ��.																																																																																																					
skill_coldown[	389	]=	400 -- 	389	��������� ������� 1 ��.																																																																																																					
skill_coldown[	390	]=	400 -- 	390	������������ ������ ��. 1																																																																																																					
skill_coldown[	391	]=	400 -- 	391	������� ����, 1 ��.																																																																																																					
skill_coldown[	392	]=	400 -- 	392	������� ���� 2 ��.																																																																																																					
skill_coldown[	393	]=	400 -- 	393	�������� ���� 2 ��.																																																																																																					
skill_coldown[	394	]=	400 -- 	394	��������� ������������� 2 ��.																																																																																																					
skill_coldown[	395	]=	400 -- 	395	������ ���� 2 ��.																																																																																																					
skill_coldown[	396	]=	400 -- 	396	��������� ������� 2 ��.																																																																																																					
skill_coldown[	397	]=	400 -- 	397	�������-��������� 2 ��.																																																																																																					
skill_coldown[	398	]=	400 -- 	398	����� 2 ��.																																																																																																					
skill_coldown[	399	]=	400 -- 	399	������ ������� 2 ��.																																																																																																					
skill_coldown[	400	]=	400 -- 	400	�������� ��� 2 ��.																																																																																																					
skill_coldown[	401	]=	400 -- 	401	������� ���� 2 ��.																																																																																																					
skill_coldown[	402	]=	400 -- 	402	Ӱ��������LV2																																																																																																					
skill_coldown[	403	]=	400 -- 	403	������������ ������ 2 ��.																																																																																																					
skill_coldown[	404	]=	400 -- 	404	������� ���� 2 ��.																																																																																																					
skill_coldown[	405	]=	400 -- 	405	������� ���� 3 ��.																																																																																																					
skill_coldown[	406	]=	400 -- 	406	�������� ���� 3 ��.																																																																																																					
skill_coldown[	407	]=	400 -- 	407	��������� ������������� 3 ��.																																																																																																					
skill_coldown[	408	]=	400 -- 	408	������ ���� 5 ��.																																																																																																					
skill_coldown[	409	]=	400 -- 	409	��������� ������� 3 ��.																																																																																																					
skill_coldown[	410	]=	400 -- 	410	�������-���������, 3 ��.																																																																																																					
skill_coldown[	411	]=	400 -- 	411	����� 3 ��.																																																																																																					
skill_coldown[	412	]=	400 -- 	412	������ ������� 3 ��.																																																																																																					
skill_coldown[	413	]=	400 -- 	413	�������� ��� 3 ��.																																																																																																					
skill_coldown[	414	]=	400 -- 	414	������� ���� 3 ��.																																																																																																					
skill_coldown[	415	]=	400 -- 	415	��������� ������� 3 ��.																																																																																																					
skill_coldown[	416	]=	400 -- 	416	������������ ������ 3 ��.																																																																																																					
skill_coldown[	417	]=	400 -- 	417	������� ���� 3 ��.																																																																																																					
skill_coldown[	418	]=	400 -- 	418	������� ����, 4 ��.																																																																																																					
skill_coldown[	419	]=	400 -- 	419	�������������, 4 ��.																																																																																																					
skill_coldown[	420	]=	400 -- 	420	��������� ������������� 4 ��.																																																																																																					
skill_coldown[	421	]=	400 -- 	421	������ ���� 4 ��.																																																																																																					
skill_coldown[	422	]=	400 -- 	422	��������� ������� 4 ��.																																																																																																					
skill_coldown[	423	]=	400 -- 	423	�������-��������� 4 ��.																																																																																																					
skill_coldown[	424	]=	400 -- 	424	����� 4 ��.																																																																																																					
skill_coldown[	425	]=	400 -- 	425	������ ������� 4 ��.																																																																																																					
skill_coldown[	426	]=	400 -- 	426	�������� ��� 4 ��.																																																																																																					
skill_coldown[	427	]=	400 -- 	427	������� ���� 4 ��.																																																																																																					
skill_coldown[	428	]=	400 -- 	428	��������� ������� 4 ��.																																																																																																					
skill_coldown[	429	]=	400 -- 	429	������������ ������ 4 ��.																																																																																																					
skill_coldown[	430	]=	400 -- 	430	������� ���� 4 ��.																																																																																																					
skill_coldown[	431	]=	400 -- 	431	������� ���� 5 ��.																																																																																																					
skill_coldown[	432	]=	400 -- 	432	������������� 5 ��.																																																																																																					
skill_coldown[	433	]=	400 -- 	433	��������LV5																																																																																																					
skill_coldown[	434	]=	400 -- 	434	������ ���� 5 ��.																																																																																																					
skill_coldown[	435	]=	400 -- 	435	��������� ������� 5 ��.																																																																																																					
skill_coldown[	436	]=	400 -- 	436	�������-��������� 5 ��.																																																																																																					
skill_coldown[	437	]=	400 -- 	437	�״�LV5																																																																																																					
skill_coldown[	438	]=	400 -- 	438	������ ������� 5 ��.																																																																																																					
skill_coldown[	439	]=	400 -- 	439	�������� ��� 5 ��.																																																																																																					
skill_coldown[	440	]=	400 -- 	440	��ʴ��LV5																																																																																																					
skill_coldown[	441	]=	400 -- 	441	��������� ������� 5 ��.																																																																																																					
skill_coldown[	442	]=	400 -- 	442	������������ ������ 5 ��.																																																																																																					
skill_coldown[	443	]=	400 -- 	443	������� ���� 5 ��.																																																																																																					
skill_coldown[	444	]=	0 -- 	444	��������������� �����																																																																																																					
skill_coldown[	445	]=	0 -- 	445	����������																																																																																																					
skill_coldown[	446	]=	0 -- 	446	����������� �����																																																																																																					
skill_coldown[	447	]=	0 -- 	447	����� ����																																																																																																					
skill_coldown[	448	]=	0 -- 	448	��������� �����																																																																																																					
skill_coldown[	449	]=	0 -- 	449	����� �����																																																																																																					
skill_coldown[	450	]=	0 -- 	450	���� ����																																																																																																					
skill_coldown[	451	]=	0 -- 	451	��������� �����																																																																																																					
skill_coldown[	452	]=	0 -- 	452	������ ������																																																																																																					
skill_coldown[	453	]=	0 -- 	453	�������� ����																																																																																																					
skill_coldown[	454	]=	0 -- 	454	�������������																																																																																																					
skill_coldown[	455	]=	0 -- 	455	���� �������																																																																																																					
skill_coldown[	456	]=	0 -- 	456	����� �����																																																																																																					
skill_coldown[	457	]=	0 -- 	457	����������� ���������																																																																																																					
skill_coldown[	458	]=	0 -- 	458	��������� ���																																																																																																					
skill_coldown[	459	]=	0 -- 	459	����������� ���� ������������																																																																																																					
skill_coldown[	460	]=	0 -- 	460	������ ������																																																																																																					
skill_coldown[	461	]=	0 -- 	461	�����������																																																																																																					
skill_coldown[	462	]=	0 -- 	462	�������� �����, ��������������� �������� �� ��������																																																																																																					
skill_coldown[	463	]=	0 -- 	463	Titan Potoin																																																																																																					
skill_coldown[	464	]=	0 -- 	464	��������������																																																																																																					
skill_coldown[	465	]=	0 -- 	465	����� �������																																																																																																					
skill_coldown[	466	]=	0 -- 	466	������ ������������ �������																																																																																																					
skill_coldown[	467	]=	0 -- 	467	��� �����																																																																																																					
skill_coldown[	468	]=	0 -- 	468	����� �� ����� 1 ������																																																																																																					
skill_coldown[	469	]=	0 -- 	469	����� �� ����� 2 ������																																																																																																					
skill_coldown[	470	]=	0 -- 	470	����� �� ����� 3 ������																																																																																																					
skill_coldown[	471	]=	0 -- 	471	����� �� ����� 4 ������																																																																																																					
skill_coldown[	472	]=	0 -- 	472	������ ������																																																																																																					
skill_coldown[	473	]=	0 -- 	473	Exploding Zeus																																																																																																					
skill_coldown[	474	]=	0 -- 	474	����� ������������� ����																																																																																																					
skill_coldown[	475	]=	0 -- 	475	������ ���� �������																																																																																																					
skill_coldown[	476	]=	0 -- 	476	����������� ���																																																																																																					
skill_coldown[	477	]=	0 -- 	477	Deity Totem ������																																																																																																					
skill_coldown[	478	]=	0 -- 	478	Holy Totem ������																																																																																																					
skill_coldown[	479	]=	0 -- 	479	����� �����																																																																																																					
skill_coldown[	480	]=	0 -- 	480	����� �������																																																																																																					
skill_coldown[	481	]=	0 -- 	481	Devil Fireball																																																																																																					
skill_coldown[	482	]=	0 -- 	482	Big Frost Spear																																																																																																					
skill_coldown[	483	]=	0 -- 	483	Small Frost Spear																																																																																																					
skill_coldown[	484	]=	0 -- 	484	Dead Scream																																																																																																					
skill_coldown[	485	]=	0 -- 	485	������� ������																																																																																																					
skill_coldown[	486	]=	0 -- 	486	��������� ������																																																																																																					
skill_coldown[	487	]=	0 -- 	487	����������� ������																																																																																																					
skill_coldown[	488	]=	0 -- 	488	Protector ������																																																																																																					
skill_coldown[	489	]=	0 -- 	489	Devil Frostball				
																																																																																																	
